@implementation CIDisparityRefinement

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[8];
  _QWORD v15[10];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryColorAdjustment");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v13[4] = CFSTR("CICategoryApplePrivate");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v15[1] = CFSTR("11");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.13");
  v14[3] = CFSTR("inputPropagateKernel");
  v11[0] = CFSTR("CIAttributeSliderMin");
  v11[1] = CFSTR("CIAttributeSliderMax");
  v12[0] = &unk_1E2F194E0;
  v12[1] = &unk_1E2F194F0;
  v11[2] = CFSTR("CIAttributeMin");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F194E0;
  v12[3] = &unk_1E2F194F0;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F19500;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v14[4] = CFSTR("inputSmoothSigma");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F194E0;
  v10[1] = &unk_1E2F19500;
  v9[2] = CFSTR("CIAttributeMin");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F194E0;
  v10[3] = &unk_1E2F19500;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F19510;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v14[5] = CFSTR("inputPropogateMinWeightSum");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F194E0;
  v8[1] = &unk_1E2F19520;
  v8[2] = &unk_1E2F194E0;
  v8[3] = &unk_1E2F19520;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19530;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v14[6] = CFSTR("inputPropogateSigmaLuma");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F194E0;
  v6[1] = &unk_1E2F19540;
  v5[2] = CFSTR("CIAttributeMin");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F194E0;
  v6[3] = &unk_1E2F19540;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F19550;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v14[7] = CFSTR("inputPropogateSigmaChroma");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F194E0;
  v4[1] = &unk_1E2F19540;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F194E0;
  v4[3] = &unk_1E2F19540;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F194F0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)_initialConversionRGB
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CIInitialConversionRGB);
}

- (id)_pyramidGenerateLevel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CIPyramidGenerateLevel);
}

- (id)_propagateDisparity
{
  if (-[CIDisparityRefinement _propagateDisparity]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinement _propagateDisparity]::onceToken, &__block_literal_global_17);
  return (id)-[CIDisparityRefinement _propagateDisparity]::kernel;
}

CIKernel *__44__CIDisparityRefinement__propagateDisparity__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", CFSTR("float _local_yuvWeightG(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparity(sampler inDispMap,sampler yuv0,sampler yuv1,vec4 params)\n{\n    int   radius        = int(params.x); \n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    for (int y = -radius; y <= radius; y++) {\n        for (int x = -radius; x <= radius; x++) {\n        \t vec2 p  = vec2(float(x),float(y));\n            vec4 p2 = sample(yuv1,      samplerTransform(yuv1,      gidHalf + p));\n            float d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + p)).r;\n            float w = _local_yuvWeightG(ref, p2, sigmaLCRecip);\n            sow+= w; sowd+= w * d;\n        }\n    }\n    float alt = sample(inDispMap, samplerTransform(inDispMap, gidHalf)).r;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"));
  -[CIDisparityRefinement _propagateDisparity]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityR1
{
  if (-[CIDisparityRefinement _propagateDisparityR1]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityR1]::onceToken, &__block_literal_global_36);
  return (id)-[CIDisparityRefinement _propagateDisparityR1]::kernel;
}

CIKernel *__46__CIDisparityRefinement__propagateDisparityR1__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", CFSTR("float _local_yuvWeight(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityR1(sampler inDispMap,sampler yuv0,sampler yuv1,vec4 params)\n{\n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    vec4 p;\n    float d, w;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, -1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, -1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    float alt = d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, 0.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, 0.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2(-1.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2(-1.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 0.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 0.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    p = sample(yuv1,      samplerTransform(yuv1,      gidHalf + vec2( 1.0, 1.0)));\n    d = sample(inDispMap, samplerTransform(inDispMap, gidHalf + vec2( 1.0, 1.0))).r;\n    w = _local_yuvWeight(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * d;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"));
  -[CIDisparityRefinement _propagateDisparityR1]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityR1Combined
{
  if (-[CIDisparityRefinement _propagateDisparityR1Combined]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityR1Combined]::onceToken, &__block_literal_global_39);
  return (id)-[CIDisparityRefinement _propagateDisparityR1Combined]::kernel;
}

CIKernel *__54__CIDisparityRefinement__propagateDisparityR1Combined__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", CFSTR("float _local_yuvWeightC(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityR1C(sampler image,sampler yuv0,vec4 params)\n{\n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    vec4 p;\n    float w;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 0.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, -1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, 0.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    float alt = p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, 0.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2(-1.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 0.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    p = sample(image, samplerTransform(image, gidHalf + vec2( 1.0, 1.0)));\n    w = _local_yuvWeightC(ref, p, sigmaLCRecip);\n    sow+= w; sowd+= w * p.a;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"));
  -[CIDisparityRefinement _propagateDisparityR1Combined]::kernel = (uint64_t)result;
  return result;
}

- (id)_propagateDisparityCombined
{
  if (-[CIDisparityRefinement _propagateDisparityCombined]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinement _propagateDisparityCombined]::onceToken, &__block_literal_global_42_0);
  return (id)-[CIDisparityRefinement _propagateDisparityCombined]::kernel;
}

CIKernel *__52__CIDisparityRefinement__propagateDisparityCombined__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", CFSTR("float _local_yuvWeightG2(vec4 pix1,vec4 pix2,vec2 sigmaLumaChmaRecip)\n{\n    vec3 yuv = pix1.xyz - pix2.xyz;\n    yuv.xyz = (yuv.xyz * yuv.xyz) * sigmaLumaChmaRecip.xyy;\n    return exp(-(yuv.x+yuv.y+yuv.z));\n}\n\nkernel vec4 _CIPropagateDisparityRC(sampler image,sampler yuv0,vec4 params)\n{\n    int   radius        = int(params.x); \n    vec2  sigmaLCRecip  = params.yz;\n    float pmws          = params.w; \n    vec2  dc            = destCoord();\n\n    vec2 gidHalf = floor(0.5*dc) + vec2(0.5);\n\n    vec4  ref           = sample(yuv0, samplerTransform(yuv0, dc));\n    float sow           = 0.0;\n    float sowd          = 0.0;\n    \n    for (int y = -radius; y <= radius; y++) {\n        for (int x = -radius; x <= radius; x++) {\n            vec4  p = sample(image, samplerTransform(image, gidHalf + vec2(float(x), float(y))));\n            float w = _local_yuvWeightG2(ref, p, sigmaLCRecip);\n            sow+= w; sowd+= w * p.a;\n        }\n    }\n    float alt = sample(image, samplerTransform(image, gidHalf)).r;\n    float rc = (sow < pmws) ? alt : (sowd / sow);\n\t\n\treturn vec4(rc,rc,rc,1.0);\n}\n\n"));
  -[CIDisparityRefinement _propagateDisparityCombined]::kernel = (uint64_t)result;
  return result;
}

- (id)_smoothDisparity
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CISmoothDisparity);
}

- (id)initialConversionForSize:(CGSize)a3 useMetal:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  CGColorSpace *v8;
  CIImage *v9;
  CGColorSpace *v10;
  CIImage *v11;
  double v12;
  float v13;
  double v14;
  float v15;
  id v16;
  CIImage *v17;
  uint64_t v18;
  CIImage *v19;
  BOOL v20;
  const __CFString *v21;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  float *v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  float v32;
  CIVector *v33;
  CIImage *v34;
  _QWORD v35[2];
  _QWORD v36[3];
  _QWORD v37[4];

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v37[3] = *MEMORY[0x1E0C80C00];
  v8 = -[CIImage colorSpace](self->inputImage, "colorSpace");
  if (v8)
  {
    v9 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v8);
  }
  else
  {
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v9 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v10);
    CGColorSpaceRelease(v10);
  }
  v36[0] = CFSTR("inputRVector");
  v37[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.2126, 0.7152, 0.0722, 0.0);
  v36[1] = CFSTR("inputGVector");
  v37[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", -0.114572, -0.385428, 0.5, 0.5);
  v36[2] = CFSTR("inputBVector");
  v37[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.5, -0.454153, -0.045847, 0.5);
  v11 = -[CIImage imageByApplyingFilter:withInputParameters:](v9, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
  saveImage(v11, (uint64_t)CFSTR("/tmp/yuvImageUsingConstants.tiff"), 0);
  v29 = 0;
  v30 = (float *)&v29;
  v31 = 0x2020000000;
  v32 = 0.0;
  -[CIImage extent](self->inputImage, "extent");
  v13 = v12 / width;
  v32 = v13;
  v25 = 0;
  v26 = (float *)&v25;
  v27 = 0x2020000000;
  v28 = 0.0;
  -[CIImage extent](self->inputImage, "extent");
  v15 = v14 / height;
  v28 = v15;
  v16 = -[CIDisparityRefinement _initialConversionRGB](self, "_initialConversionRGB");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__CIDisparityRefinement_initialConversionForSize_useMetal___block_invoke;
  v24[3] = &unk_1E2EC35F0;
  v24[4] = &v29;
  v24[5] = &v25;
  v35[0] = v11;
  v35[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v30[6], v26[6]);
  v17 = (CIImage *)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", v24, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2), 0.0, 0.0, width, height);
  v23 = 0;
  v34 = v11;
  v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v33 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -2.0, -2.0);
  v19 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessor, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", CFSTR("kernel_InitialConversion"), v18, &unk_1E2F1DBE8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1), 0, 0, 0.0, 0.0, width, height, &v23);
  if (v19)
    v20 = v4;
  else
    v20 = 0;
  if (v20 && v23 == 0)
    v17 = v19;
  if (v4)
    v21 = CFSTR("/tmp/initialConversion-Metal.tiff");
  else
    v21 = CFSTR("/tmp/initialConversion-CI.tiff");
  saveImage(v17, (uint64_t)v21, 0);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v17;
}

double __59__CIDisparityRefinement_initialConversionForSize_useMetal___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double result;
  CGRect v8;

  v5 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v8.origin.x = a2 * v5;
  v6 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8.origin.y = a3 * v6;
  v8.size.width = a4 * v5;
  v8.size.height = a5 * v6;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v8, -2.0, -2.0);
  return result;
}

- (id)shiftmapLevelZeroWithSize:(CGSize)a3 useMetal:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v8;
  float v9;
  float v10;
  double v11;
  float v12;
  CIImage *inputDisparityImage;
  float v14;
  double v15;
  double v16;
  CIImage *v17;
  uint64_t v18;
  uint64_t v19;
  CIImage *v20;
  BOOL v21;
  const __CFString *v22;
  uint64_t v24;
  CGAffineTransform v25;
  const __CFString *v26;
  CIVector *v27;
  CIVector *v28;
  _QWORD v29[2];

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v29[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputDisparityImage, "extent");
  v9 = v8;
  v10 = v9 / width;
  -[CIImage extent](self->inputDisparityImage, "extent");
  v12 = v11;
  inputDisparityImage = self->inputDisparityImage;
  v14 = v12 / height;
  v15 = v10;
  v16 = v14;
  CGAffineTransformMakeScale(&v25, 1.0 / v15, 1.0 / v14);
  v17 = -[CIImage imageByApplyingTransform:](inputDisparityImage, "imageByApplyingTransform:", &v25);
  v24 = 0;
  v29[0] = self->inputDisparityImage;
  v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v28 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v15, v16);
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v26 = CFSTR("scaleFactors");
  v27 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v15, v16);
  v20 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", CFSTR("kernel_UpscaleShiftmap"), v18, 0, 0, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1), 0.0, 0.0, width, height, &v24);
  if (v20)
    v21 = v4;
  else
    v21 = 0;
  if (v21 && v24 == 0)
    v17 = v20;
  if (v4)
    v22 = CFSTR("/tmp/upsampledShiftmap-Metal.tiff");
  else
    v22 = CFSTR("/tmp/upsampledShiftmap-CI.tiff");
  saveImage(v17, (uint64_t)v22, 1);
  return v17;
}

- (id)generatePyramidLevel:(id)a3 useMetal:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CIImage *v16;
  uint64_t v17;
  CIImage *v18;
  BOOL v19;
  const __CFString *v20;
  uint64_t v22;
  CIVector *v23;
  id v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  v8 = v7 * 0.5;
  v10 = v9 * 0.5;
  v12 = v11 * 0.5;
  v14 = v13 * 0.5;
  v15 = -[CIDisparityRefinement _pyramidGenerateLevel](self, "_pyramidGenerateLevel");
  v25[0] = a3;
  v16 = (CIImage *)objc_msgSend(v15, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_75, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1), v8, v10, v12, v14);
  v22 = 0;
  v24 = a3;
  v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v23 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v18 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessor, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", CFSTR("kernel_PyramidGenerateLevel"), v17, &unk_1E2F1DC00, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1), 0, 0, v8, v10, v12, v14, &v22);
  if (v22)
    v19 = 0;
  else
    v19 = v4;
  if (v19 && v18 != 0)
    v16 = v18;
  if (v4)
    v20 = CFSTR("/tmp/pyramidLevel1-Metal.tiff");
  else
    v20 = CFSTR("/tmp/pyramidLevel1-CI.tiff");
  saveImage(v16, (uint64_t)v20, 0);
  return v16;
}

double __55__CIDisparityRefinement_generatePyramidLevel_useMetal___block_invoke(double a1)
{
  return a1 + a1;
}

- (id)smoothDisparityImage:(id)a3 useMetal:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  CIVector *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  CIImage *v40;
  _BOOL4 v41;
  CIImage *v43;
  const __CFString *v44;
  unsigned int v45;
  unsigned int v46;
  _DWORD v47[3];
  float32x2_t v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = a4;
  -[CIVector CGPointValue](self->inputOriginalSize, "CGPointValue");
  v8 = v7;
  v10 = v9;
  -[CIImage extent](self->inputImage, "extent");
  v12 = v11;
  v14 = v13;
  -[CIImage extent](self->inputDisparityImage, "extent");
  v16 = v15;
  v18 = v17;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v19 = shiftmapSize(v12, v14, v16, v18, v8, v10);
  v21 = v20;
  -[NSNumber floatValue](self->inputSmoothSigma, "floatValue");
  LODWORD(v12) = v22;
  -[NSNumber floatValue](self->inputPropagateSigmaLuma, "floatValue");
  v46 = v23;
  -[NSNumber floatValue](self->inputPropagateSigmaChma, "floatValue");
  v45 = v24;
  v25 = *(float *)&v12 * (float)(*(float *)&v12 + *(float *)&v12);
  v26 = (void *)objc_msgSend((id)objc_msgSend(a3, "imageByClampingToExtent"), "imageBySamplingNearest");
  if (v25 <= 0.0001)
    v27 = 0.0001;
  else
    v27 = v25;
  v28 = exp(-1.0 / v27);
  v29 = exp(-1.41421356 / v27);
  v30 = v28 * 4.0 + 1.0 + v29 * 4.0;
  v31 = 1.0 / v30;
  v32 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:");
  v33 = -[CIDisparityRefinement _smoothDisparity](self, "_smoothDisparity");
  v55[0] = v26;
  v55[1] = v32;
  v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v53[0] = CFSTR("kCIKernelOutputFormat");
  v53[1] = CFSTR("kCIImageAlphaOne");
  v54[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v54[1] = MEMORY[0x1E0C9AAB0];
  v35 = objc_msgSend(v33, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_85, v34, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2), 0.0, 0.0, v19, v21);
  v49 = 0;
  if (v4)
  {
    -[NSNumber floatValue](self->inputPropagateKernel, "floatValue");
    v47[1] = (int)v36;
    -[NSNumber floatValue](self->inputPropagateMinWeightSum, "floatValue");
    v48 = vmul_f32((float32x2_t)__PAIR64__(v45, v46), vadd_f32((float32x2_t)__PAIR64__(v45, v46), (float32x2_t)__PAIR64__(v45, v46)));
    v47[2] = v37;
    *(float *)v47 = v27;
    v38 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47, 20);
    v52 = v26;
    v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v50 = CFSTR("config");
    v51 = v38;
    v40 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:arguments:error:", CFSTR("kernel_SmoothDisparity"), v39, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1), &v49, 0.0, 0.0, v19, v21);
    v41 = v49 == 0;
  }
  else
  {
    v40 = 0;
    v41 = 1;
  }
  if (v41 && v4 && v40 != 0)
    v43 = v40;
  else
    v43 = (CIImage *)v35;
  if (v28 == 0.0 && v29 == 0.0 && v31 == 1.0)
    v43 = (CIImage *)objc_msgSend(v26, "imageByCroppingToRect:", 0.0, 0.0, v19, v21);
  if (v4)
    v44 = CFSTR("/tmp/smoothDisparity-Metal.tiff");
  else
    v44 = CFSTR("/tmp/smoothDisparity-CI.tiff");
  saveImage(v43, (uint64_t)v44, 1);
  return v43;
}

double __55__CIDisparityRefinement_smoothDisparityImage_useMetal___block_invoke(double a1)
{
  return a1 + -1.0;
}

- (id)_combineImages
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_combineImages);
}

- (id)propagateDisparity:(id)a3 pyramids:(id *)a4 useMetal:(BOOL)a5 computedPyramidLevels:(int)a6
{
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  int v18;
  float v19;
  float v20;
  float v21;
  int v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  CIVector *v43;
  float v44;
  int v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  BOOL v60;
  const char *v61;
  CIDisparityRefinement *v63;
  _BOOL4 v64;
  id v65;
  CIVector *v66;
  _DWORD v67[5];
  uint64_t v68;
  _QWORD v69[5];
  uint64_t v70;
  float *v71;
  uint64_t v72;
  int v73;
  const __CFString *v74;
  uint64_t v75;
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[4];
  _QWORD v81[4];

  v64 = a5;
  v81[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputSmoothSigma, "floatValue");
  v11 = v10;
  -[NSNumber floatValue](self->inputPropagateSigmaLuma, "floatValue");
  v13 = v12;
  -[NSNumber floatValue](self->inputPropagateSigmaChma, "floatValue");
  v15 = v14;
  -[NSNumber floatValue](self->inputPropagateMinWeightSum, "floatValue");
  v17 = v16;
  v70 = 0;
  v71 = (float *)&v70;
  v72 = 0x2020000000;
  v73 = 0;
  -[NSNumber floatValue](self->inputPropagateKernel, "floatValue");
  v73 = v18;
  v81[0] = a3;
  v81[1] = 0;
  -[NSNumber floatValue](self->inputPropagateKernel, "floatValue");
  v19 = v13 * (float)(v13 + v13);
  v20 = v15 * (float)(v15 + v15);
  v66 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v21, 65025.0 / v19, 65025.0 / v20, v17);
  if (fabs(v71[6] + -1.0) >= 0.001)
    v65 = -[CIDisparityRefinement _propagateDisparity](self, "_propagateDisparity");
  else
    v65 = -[CIDisparityRefinement _propagateDisparityR1](self, "_propagateDisparityR1");
  if (a6 >= 2)
  {
    v63 = self;
    v22 = 0;
    v23 = a6;
    v24 = v11 * (float)(v11 + v11);
    while (1)
    {
      v25 = objc_msgSend(a3, "imageByClampingToExtent");
      v26 = (v23 - 2);
      v27 = objc_msgSend(a4[v26], "imageByClampingToExtent");
      v28 = objc_msgSend(a4[--v23], "imageByClampingToExtent");
      if (!v25)
        break;
      v29 = v28;
      if (!v27 || v28 == 0)
        break;
      objc_msgSend(a4[v26], "extent");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __84__CIDisparityRefinement_propagateDisparity_pyramids_useMetal_computedPyramidLevels___block_invoke;
      v69[3] = &unk_1E2EC3638;
      v69[4] = &v70;
      v80[0] = v25;
      v80[1] = v27;
      v80[2] = v29;
      v80[3] = v66;
      v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
      v78[0] = CFSTR("kCIKernelOutputFormat");
      v40 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
      v78[1] = CFSTR("kCIImageAlphaOne");
      v79[0] = v40;
      v79[1] = MEMORY[0x1E0C9AAB0];
      v41 = (void *)objc_msgSend(v65, "applyWithExtent:roiCallback:arguments:options:", v69, v39, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2), v32, v34, v36, v38);
      v42 = v41;
      if (v64)
      {
        v68 = 0;
        v43 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)-v71[6], (float)-v71[6]);
        -[NSNumber floatValue](v63->inputPropagateKernel, "floatValue");
        v67[1] = (int)v44;
        -[NSNumber floatValue](v63->inputPropagateMinWeightSum, "floatValue");
        *(float *)&v67[3] = v19;
        *(float *)&v67[4] = v20;
        v67[2] = v45;
        *(float *)v67 = v24;
        v46 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v67, 20);
        objc_msgSend(a4[v26], "extent");
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v55 = objc_msgSend(a3, "imageByClampingToExtent");
        v56 = a4[v26];
        v77[0] = v55;
        v77[1] = v56;
        v77[2] = objc_msgSend(a4[v23], "imageByClampingToExtent");
        v57 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
        v76[0] = v43;
        v76[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
        v76[2] = v43;
        v58 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
        v74 = CFSTR("config");
        v75 = v46;
        v59 = +[CIGenericMetalProcessor applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:](CIGenericMetalProcessorSingleChannel, "applyWithExtent:shader:inputs:roiMethods:insetRects:scaleFactors:arguments:error:", CFSTR("kernel_PropagateDisparity"), v57, &unk_1E2F1DC18, v58, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1), v48, v50, v52, v54, &v68);
        if (v59)
          v60 = v68 == 0;
        else
          v60 = 0;
        if (v60)
          a3 = v59;
        else
          a3 = v42;
        v61 = "Metal";
      }
      else
      {
        v61 = "CI";
        a3 = v41;
      }
      saveImage((CIImage *)a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/propagateDisparity_%d-%s.tiff"), v23, v61), 1);
      v22 ^= 1u;
      v81[v22] = a3;
      if ((unint64_t)(v23 + 1) <= 2)
        goto LABEL_23;
    }
    a3 = (id)v81[v22];
  }
LABEL_23:
  _Block_object_dispose(&v70, 8);
  return a3;
}

double __84__CIDisparityRefinement_propagateDisparity_pyramids_useMetal_computedPyramidLevels___block_invoke(uint64_t a1, int a2, double result, double a4, double a5, double a6)
{
  CGFloat v6;
  CGRect v7;

  if (a2 != 1)
  {
    v7.origin.x = result * 0.5;
    v7.origin.y = a4 * 0.5;
    v7.size.width = a5 * 0.5;
    v7.size.height = a6 * 0.5;
    v6 = (float)-*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)&result = (unint64_t)CGRectInset(v7, v6, v6);
  }
  return result;
}

- (id)outputImageUsingMetal:(BOOL)a3
{
  CIImage *inputDisparityImage;
  _BOOL8 v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  unsigned int v23;
  float v24;
  unsigned int v25;
  double v26;
  unsigned int v27;
  double v28;
  unsigned int v29;
  unsigned int v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  double v36;
  double v37;
  CIImage *v38;
  CIImage *v39;
  const __CFString *v40;
  id v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage", a3);
  inputDisparityImage = self->inputDisparityImage;
  if (!inputDisparityImage)
    return +[CIImage emptyImage](CIImage, "emptyImage", a3);
  v5 = a3;
  v6 = 1;
  saveImage(inputDisparityImage, (uint64_t)CFSTR("/tmp/inputToDisparity.tiff"), 1);
  -[CIVector CGPointValue](self->inputOriginalSize, "CGPointValue");
  v8 = v7;
  v10 = v9;
  -[CIImage extent](self->inputImage, "extent");
  v12 = v11;
  v14 = v13;
  -[CIImage extent](self->inputDisparityImage, "extent");
  v16 = v15;
  v18 = v17;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v19 = shiftmapSize(v12, v14, v16, v18, v8, v10);
  v21 = v20;
  v22 = v19;
  v23 = vcvtps_u32_f32(v22);
  v24 = v20;
  v25 = vcvtps_u32_f32(v24);
  -[CIImage extent](self->inputDisparityImage, "extent");
  v27 = vcvtmd_u64_f64(v26);
  -[CIImage extent](self->inputDisparityImage, "extent");
  v29 = 2 * vcvtmd_u64_f64(v28);
  if (2 * v27 <= v23 && v29 <= v25)
  {
    do
    {
      v31 = v6;
      v6 = (v6 + 1);
      if (v31 > 2)
        break;
      v23 = (v23 + 1) >> 1;
      if (v23 < 2 * v27)
        break;
      v25 = (v25 + 1) >> 1;
    }
    while (v25 >= v29);
  }
  memset(v43, 0, 24);
  v32 = -[CIDisparityRefinement initialConversionForSize:useMetal:](self, "initialConversionForSize:useMetal:", v5, v19, v21);
  v42 = v32;
  if (!v32)
    return +[CIImage emptyImage](CIImage, "emptyImage", a3);
  if (v6 >= 2)
  {
    v33 = v32;
    v34 = v43;
    v35 = v6 - 1;
    do
    {
      v33 = -[CIDisparityRefinement generatePyramidLevel:useMetal:](self, "generatePyramidLevel:useMetal:", v33, v5);
      *v34++ = v33;
      --v35;
    }
    while (v35);
  }
  objc_msgSend((id)v43[(v6 - 1) - 1], "extent");
  v38 = -[CIDisparityRefinement smoothDisparityImage:useMetal:](self, "smoothDisparityImage:useMetal:", -[CIDisparityRefinement propagateDisparity:pyramids:useMetal:computedPyramidLevels:](self, "propagateDisparity:pyramids:useMetal:computedPyramidLevels:", -[CIDisparityRefinement shiftmapLevelZeroWithSize:useMetal:](self, "shiftmapLevelZeroWithSize:useMetal:", v5, v36, v37), &v42, v5, v6), v5);
  v39 = v38;
  if (v5)
    v40 = CFSTR("/tmp/smoothed-Metal.tiff");
  else
    v40 = CFSTR("/tmp/smoothed-CI.tiff");
  saveImage(v38, (uint64_t)v40, 1);
  return v39;
}

- (id)outputImage
{
  id v3;
  id v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputDisparityImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = -[CIDisparityRefinement outputImageUsingMetal:](self, "outputImageUsingMetal:", 0);
  v4 = -[CIDisparityRefinement outputImageUsingMetal:](self, "outputImageUsingMetal:", 1);
  if (v4)
  {
    v6[0] = v3;
    v6[1] = v4;
    return +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2), &__block_literal_global_117);
  }
  return v3;
}

uint64_t __36__CIDisparityRefinement_outputImage__block_invoke(uint64_t a1, void *a2)
{
  return useMetalImage(a2);
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputDisparityImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputPropagateKernel
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPropagateKernel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputSmoothSigma
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputSmoothSigma:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputPropagateMinWeightSum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputPropagateMinWeightSum:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputPropagateSigmaLuma
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputPropagateSigmaLuma:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputPropagateSigmaChma
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputPropagateSigmaChma:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (CIVector)inputOriginalSize
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputOriginalSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

@end
