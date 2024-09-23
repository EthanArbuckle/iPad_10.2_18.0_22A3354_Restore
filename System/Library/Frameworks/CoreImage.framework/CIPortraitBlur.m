@implementation CIPortraitBlur

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v11[4] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("11");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.13");
  v12[3] = CFSTR("inputLumaNoiseScale");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F1A7B0;
  v10[1] = &unk_1E2F1A7C0;
  v9[2] = CFSTR("CIAttributeMin");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1A7B0;
  v10[3] = &unk_1E2F1A7C0;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1A7D0;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[4] = CFSTR("inputAperture");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1A7E0;
  v8[1] = &unk_1E2F1A7F0;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1A7B0;
  v8[3] = &unk_1E2F1A7F0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1A7B0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputShape");
  v5 = CFSTR("CIAttributeClass");
  v6 = CFSTR("NSString");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v12[6] = CFSTR("inputDraftMode");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1BC68;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1BC80;
  v4[3] = &unk_1E2F1BC68;
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernel
{
  if (-[CIPortraitBlur _kernel]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur _kernel]::onceToken, &__block_literal_global_122);
  return (id)-[CIPortraitBlur _kernel]::k;
}

CIKernel *__25__CIPortraitBlur__kernel__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", CFSTR("vec2 _pseudo_randPBN( vec2 pos)\n{\n    float rand1 = mod(12.63 * pos.x - 57.3 * pos.y * pos.y, 0.01369) + mod(75.833 * pos.y - 37.135 * pos.x * pos.x, 0.014) + mod(39.7 * pos.x * pos.y + 21.7 * pos.x * pos.y * pos.y, 0.0879);\n\n    vec2 rand2 = fract(3576.7453 * vec2( rand1, 2.0 * rand1));\n    return fract(vec2(7.7387 * (rand2.x + rand2.y), 33.707 * (rand2.x - rand2.y)));\n}\n\nvec4 _pixWeight( vec4 sampledPix,vec2 offset,float basePixRawR,float distWeight,vec2 spatialWeightSoftMinMax ,float highlightBoostGain,vec2 relativeWeightThreshold) {\n    float sampleR = 1.0 / sqrt(offset.x*offset.x + offset.y*offset.y);\n    float spatialWeight = clamp(spatialWeightSoftMinMax.x * sampledPix.w * sampleR + spatialWeightSoftMinMax.y, 0.0, 1.0);\n    float colorWeight = highlightBoostGain * (sampledPix.x + sampledPix.y + sampledPix.z) + 1.0; \n    float backgroundWeight = (3.0 - 2.0 * sampledPix.w);\n    float rwT = clamp(relativeWeightThreshold.x * (sampledPix.w - basePixRawR) + relativeWeightThreshold.y, 0.0, 1.0);\n    float relativeWeight = rwT * rwT * (3.0 - 2.0 * rwT); \n    float totalWeight = distWeight * spatialWeight * colorWeight * backgroundWeight * relativeWeight;\n    return vec4( totalWeight * sampledPix.xyz, totalWeight);\n}\nfloat _ushortMultiply(float a,float multiplier) {\n   int q = int(a) * int(multiplier);\n   int r = q/65536;\n   int m = q - r * 65536;\n   float mf = float(m);\n   return mf + compare(mf, 65535.0, 0.0);\n}\nkernel vec4 _CIPortraitBlur(sampler image,vec4 sizeAndScale,vec3 p0,vec4 p1,vec2 relativeWeightThreshold) \n{\n   float maxBlurInPixels         = p0.x;\n   float sharpRadius             = p0.y;\n   float highlightBoostGain      = p0.z;\n   vec2 spatialWeightSoftMinMax  = p1.xy;\n   float basePixelWeight         = p1.z;\n   int numSamples                = int(p1.w);\n    vec2 dc = destCoord();\n    vec4 basePix = sample(image, samplerCoord(image));\n    float rawBlurRadius = basePix.w * basePix.w;\n    float blurRadius = rawBlurRadius * maxBlurInPixels;\n    vec4 outRGB;\n    if (blurRadius >= sharpRadius)\n    {\n      vec4 pixSum = vec4(basePix.xyz * basePixelWeight, basePixelWeight);\n\t   vec2 randXY = _pseudo_randPBN(dc/sizeAndScale.xy) * sizeAndScale.zw * 65536.0;\n      for (int i = 0; i < numSamples; i++)\n      {\n           vec2 randXY2 = (1./32767.5) * randXY - 1.0; \n           float randDist = randXY2.x*randXY2.x + randXY2.y*randXY2.y;\n           float randNorm0 = max(abs(randXY2.x),abs(randXY2.y));\n           float randShape = randNorm0 / sqrt(randDist);\n           vec2  samplePos = randShape * rawBlurRadius * randXY2;\n           float randW = randShape * randShape;\n           samplePos.y = -samplePos.y;\n           randXY.x = _ushortMultiply(randXY.x, 28563.0);\n           randXY.y = _ushortMultiply(randXY.y, 44519.0);\n\t        vec4 pix = sample( image, samplerTransform(image, dc + maxBlurInPixels * samplePos));\n           pix.w = pix.w * pix.w;\n           pixSum += _pixWeight(pix, samplePos, rawBlurRadius, randW, spatialWeightSoftMinMax, highlightBoostGain, relativeWeightThreshold);\n        }\n        outRGB.xyz = pixSum.w > 0.0 ?  vec3(pixSum.xyz / pixSum.w) : basePix.xyz;\n        outRGB.w = basePix.w;\n    }\n    else\n    {\n        outRGB = basePix;\n    }\n\treturn outRGB;\n}\n\n"));
  -[CIPortraitBlur _kernel]::k = (uint64_t)result;
  return result;
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlur _kernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur _kernelMetal]::onceToken, &__block_literal_global_125);
  return (id)-[CIPortraitBlur _kernelMetal]::k;
}

id __30__CIPortraitBlur__kernelMetal__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurM"));
  -[CIPortraitBlur _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)_kernelWithShapesMetal
{
  if (-[CIPortraitBlur _kernelWithShapesMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur _kernelWithShapesMetal]::onceToken, &__block_literal_global_128);
  return (id)-[CIPortraitBlur _kernelWithShapesMetal]::k;
}

id __40__CIPortraitBlur__kernelWithShapesMetal__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurShapeM"));
  -[CIPortraitBlur _kernelWithShapesMetal]::k = (uint64_t)result;
  return result;
}

- (id)_kernelsWithShapes
{
  if (-[CIPortraitBlur _kernelsWithShapes]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur _kernelsWithShapes]::onceToken, &__block_literal_global_131_0);
  return (id)-[CIPortraitBlur _kernelsWithShapes]::k;
}

CIKernel *__36__CIPortraitBlur__kernelsWithShapes__block_invoke()
{
  CIKernel *result;

  result = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", &cfstr_Vec2PseudoRand_1);
  -[CIPortraitBlur _kernelsWithShapes]::k = (uint64_t)result;
  return result;
}

- (id)_ourBlendKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIPortraitBlurBlendWithMaskFromAlpha);
}

- (id)_ourBlendKernelMetal
{
  if (-[CIPortraitBlur _ourBlendKernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur _ourBlendKernelMetal]::onceToken, &__block_literal_global_134);
  return (id)-[CIPortraitBlur _ourBlendKernelMetal]::k;
}

id __38__CIPortraitBlur__ourBlendKernelMetal__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV2MetalKernelNamed:](CIColorKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurBlendWithMaskFromAlphaM"));
  -[CIPortraitBlur _ourBlendKernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage:(BOOL)a3
{
  _BOOL8 v3;
  CIImage *inputBlurmapImage;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  CIImage *v20;
  CIImage *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  id v28;
  id v29;
  float v30;
  double v31;
  CIVector *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  CIVector *v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  CIVector *v58;
  uint64_t v59;
  NSString *inputShape;
  uint64_t v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  int v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  float v78;
  float v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  float v89;
  double v90;
  float v91;
  void *v92;
  double v93;
  void *v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  double v101;
  CIVector *v102;
  id v103;
  id v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  id v111;
  NSDictionary *v112;
  float v113;
  id v114;
  int v115;
  int v116;
  __float2 v117;
  CIVector *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  uint64_t v123;
  CIVector *v124;
  CIVector *v125;
  CIVector *v126;
  double v127;
  CIImage *inputImage;
  CGAffineTransform v129;
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[3];
  double v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  _QWORD v136[3];
  _QWORD v137[4];
  _QWORD v138[4];
  _QWORD v139[4];
  _QWORD v140[4];
  _QWORD v141[4];
  _QWORD v142[4];
  _QWORD v143[4];
  _QWORD v144[4];
  const __CFString *v145;
  uint64_t v146;
  _QWORD v147[7];
  const __CFString *v148;
  uint64_t v149;
  _QWORD v150[5];
  _QWORD v151[2];
  _QWORD v152[4];

  v3 = a3;
  v152[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputBlurmapImage = self->inputBlurmapImage;
  -[CIImage extent](inputBlurmapImage, "extent");
  v7 = v6;
  -[CIImage extent](self->inputImage, "extent");
  if (vabdd_f64(v7, v8) > 0.001)
  {
    -[CIImage extent](self->inputBlurmapImage, "extent");
    v10 = v9;
    -[CIImage extent](self->inputImage, "extent");
    v12 = v10 / v11;
    -[CIImage extent](self->inputBlurmapImage, "extent");
    v14 = v13;
    -[CIImage extent](self->inputImage, "extent");
    v16 = v14 / v15;
    -[CIImage extent](self->inputImage, "extent");
    v18 = v17;
    -[CIImage extent](self->inputBlurmapImage, "extent");
    if (v18 <= v19)
    {
      v20 = self->inputBlurmapImage;
      CGAffineTransformMakeScale(&v134, 1.0 / v12, 1.0 / v16);
      inputBlurmapImage = -[CIImage imageByApplyingTransform:](v20, "imageByApplyingTransform:", &v134);
    }
    else
    {
      CGAffineTransformMakeScale(&v135, v12, v16);
      inputImage = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v135);
    }
  }
  v151[0] = CFSTR("inputBlurmapImage");
  v151[1] = CFSTR("inputUseMetal");
  v152[0] = inputBlurmapImage;
  v152[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v21 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurPreProcess"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 2));
  saveImage(v21, (uint64_t)CFSTR("/tmp/preprocessed-CI.tiff"), 0);
  -[CIImage extent](v21, "extent");
  v24 = v22;
  v25 = v23;
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x2020000000;
  v133 = 0.0;
  if (v22 <= v23)
    v26 = v23;
  else
    v26 = v22;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v133 = v26 * v27;
  if (v3)
    v28 = -[CIPortraitBlur _kernelMetal](self, "_kernelMetal");
  else
    v28 = -[CIPortraitBlur _kernel](self, "_kernel");
  v29 = v28;
  if (!v28)
    v29 = -[CIPortraitBlur _kernel](self, "_kernel");
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v31 = 1.0;
  if (v30 > 0.0)
    v31 = 1.0 / v30;
  v32 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v24, v25, v31, v31);
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v34 = v33;
  SDOFRenderingValue(CFSTR("sharpRadius"), self->inputTuningParameters);
  v36 = v35;
  SDOFRenderingValue(CFSTR("highlightBoostGain"), self->inputTuningParameters);
  v37 = v24 * v34;
  v39 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v37, v36, v38);
  SDOFRenderingValue(CFSTR("nSamples"), self->inputTuningParameters);
  v41 = v40;
  if (v31 > 1.0)
  {
    v42 = 1.0 / v31;
    v43 = sqrtf(v42) * v41;
    v44 = v41 * 0.5;
    if (v44 >= v43)
      v41 = v44;
    else
      v41 = v43;
  }
  SDOFRenderingValue(CFSTR("spatialWeightSoftMin"), self->inputTuningParameters);
  v46 = v45;
  SDOFRenderingValue(CFSTR("spatialWeightSoftMax"), self->inputTuningParameters);
  v48 = v47;
  v127 = v31;
  SDOFRenderingValue(CFSTR("relativeWeightThreshold"), self->inputTuningParameters);
  v50 = v49;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v52 = v51;
  SDOFRenderingValue(CFSTR("relativeWeightThreshold"), self->inputTuningParameters);
  v54 = v53;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v56 = v55;
  v125 = v39;
  v126 = v32;
  SDOFRenderingValue(CFSTR("basePixelWeight"), self->inputTuningParameters);
  v124 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(1.0 / (float)(v48 - v46)), (float)-(float)((float)(1.0 / (float)(v48 - v46)) * v46), v57, v41);
  v58 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(0.5 / (float)(v50 / v52)), (float)((float)((float)(0.5 / (float)(v50 / v52)) * v54) / v56));
  v59 = -[CIImage imageByClampingToExtent](v21, "imageByClampingToExtent");
  inputShape = self->inputShape;
  if (!inputShape || -[NSString isEqualToString:](self->inputShape, "isEqualToString:", &stru_1E2ECD1B0))
    goto LABEL_28;
  v61 = 0;
  while (!-[NSString isEqualToString:](inputShape, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1E2EC4C50[v61])))
  {
    if (++v61 == 8)
      goto LABEL_28;
  }
  if ((_DWORD)v61 == -1)
  {
LABEL_28:
    v63 = *MEMORY[0x1E0C9D5E0];
    v64 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v65 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v66 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __30__CIPortraitBlur_outputImage___block_invoke;
    v131[3] = &unk_1E2EC3638;
    v131[4] = v132;
    v150[0] = v59;
    v150[1] = v126;
    v150[2] = v125;
    v150[3] = v124;
    v150[4] = v58;
    v67 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 5);
    v148 = CFSTR("kCIKernelOutputFormat");
    v149 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
    v68 = objc_msgSend(v29, "applyWithExtent:roiCallback:arguments:options:", v131, v67, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1), v63, v64, v65, v66);
  }
  else
  {
    if (v3)
      v62 = -[CIPortraitBlur _kernelWithShapesMetal](self, "_kernelWithShapesMetal");
    else
      v62 = -[CIPortraitBlur _kernelsWithShapes](self, "_kernelsWithShapes");
    v111 = v62;
    if (!v62)
      v111 = -[CIPortraitBlur _kernelsWithShapes](self, "_kernelsWithShapes");
    v112 = -[CIImage properties](self->inputImage, "properties");
    v113 = 0.0;
    if (v112)
    {
      v114 = -[NSDictionary objectForKey:](v112, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
      if (v114)
      {
        v115 = objc_msgSend(v114, "intValue");
        v116 = (v115 - 9) >= 0xFFFFFFF8 ? v115 - 3 : -3;
        if (v116 <= 5)
          v113 = flt_192496C58[v116];
      }
    }
    v117 = __sincosf_stret(v113);
    v118 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v117.__cosval, v117.__sinval, v117.__sinval, (float)-v117.__cosval);
    v119 = *MEMORY[0x1E0C9D5E0];
    v120 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v121 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v122 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __30__CIPortraitBlur_outputImage___block_invoke_2;
    v130[3] = &unk_1E2EC3638;
    v130[4] = v132;
    v147[0] = v59;
    v147[1] = v126;
    v147[2] = v125;
    v147[3] = v124;
    v147[4] = v58;
    v147[5] = v118;
    v147[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)(int)v61)));
    v123 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 7);
    v145 = CFSTR("kCIKernelOutputFormat");
    v146 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
    v68 = objc_msgSend(v111, "applyWithExtent:roiCallback:arguments:options:", v130, v123, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1), v119, v120, v121, v122);
  }
  v69 = (void *)v68;
  -[CIImage extent](inputImage, "extent");
  saveImage((CIImage *)objc_msgSend(v69, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/blur-CI.tiff"), 0);
  SDOFRenderingValue(CFSTR("antiAliasBlurStrength"), self->inputTuningParameters);
  v71 = v70;
  v144[0] = MEMORY[0x1E0C9AAB0];
  v143[0] = CFSTR("inputHorizontalBlur");
  v143[1] = CFSTR("inputMaxBlur");
  *(float *)&v72 = v37;
  v144[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v72);
  v143[2] = CFSTR("inputAntiAliasBlurStrength");
  LODWORD(v73) = v71;
  v144[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
  v143[3] = CFSTR("inputUseMetal");
  v144[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v74 = (void *)objc_msgSend(v69, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurDirectionalBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 4));
  -[CIImage extent](inputImage, "extent");
  saveImage((CIImage *)objc_msgSend(v74, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/blur-X-CI.tiff"), 0);
  v142[0] = MEMORY[0x1E0C9AAA0];
  v141[0] = CFSTR("inputHorizontalBlur");
  v141[1] = CFSTR("inputMaxBlur");
  *(float *)&v75 = v37;
  v142[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
  v141[2] = CFSTR("inputAntiAliasBlurStrength");
  LODWORD(v76) = v71;
  v142[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
  v141[3] = CFSTR("inputUseMetal");
  v142[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v77 = (void *)objc_msgSend(v74, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurDirectionalBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 4));
  -[CIImage extent](inputImage, "extent");
  saveImage((CIImage *)objc_msgSend(v77, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/blur-Y-CI.tiff"), 0);
  -[NSNumber floatValue](self->inputLumaNoiseScale, "floatValue");
  v79 = v78 / v127;
  v80 = 1.5;
  if (v127 < 1.5)
  {
    v139[0] = CFSTR("inputLumaNoiseAmpl");
    *(float *)&v80 = v79;
    v140[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
    v139[1] = CFSTR("inputLumaNoiseModelCoeff");
    v81 = (void *)MEMORY[0x1E0CB37E8];
    SDOFRenderingValue(CFSTR("lumaNoiseModelCoeff"), self->inputTuningParameters);
    v140[1] = objc_msgSend(v81, "numberWithFloat:");
    v139[2] = CFSTR("inputExtent");
    -[CIImage extent](v21, "extent");
    v140[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v139[3] = CFSTR("inputUseMetal");
    v140[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v77 = (void *)objc_msgSend(v77, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurNoise"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 4));
    -[CIImage extent](inputImage, "extent");
    saveImage((CIImage *)objc_msgSend(v77, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/blur-NoiseAddedHalfRes-CI.tiff"), 0);
  }
  v82 = (void *)objc_msgSend(v77, "_imageByRenderingToIntermediate");
  -[CIImage extent](self->inputImage, "extent");
  v84 = v83;
  -[CIImage extent](inputImage, "extent");
  v86 = v85;
  -[CIImage extent](self->inputImage, "extent");
  v88 = v87;
  -[CIImage extent](inputImage, "extent");
  v89 = v84 / v86;
  v91 = v88 / v90;
  CGAffineTransformMakeScale(&v129, v89, v91);
  v92 = (void *)objc_msgSend(v82, "imageByApplyingTransform:", &v129);
  -[CIImage extent](self->inputImage, "extent");
  saveImage((CIImage *)objc_msgSend(v92, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/upsampledBlurredImage.tiff"), 0);
  v93 = 1.5;
  if (v127 >= 1.5)
  {
    v137[0] = CFSTR("inputLumaNoiseAmpl");
    *(float *)&v93 = v79;
    v138[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93);
    v137[1] = CFSTR("inputLumaNoiseModelCoeff");
    v94 = (void *)MEMORY[0x1E0CB37E8];
    SDOFRenderingValue(CFSTR("lumaNoiseModelCoeff"), self->inputTuningParameters);
    v138[1] = objc_msgSend(v94, "numberWithFloat:");
    v137[2] = CFSTR("inputExtent");
    -[CIImage extent](v21, "extent");
    v138[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v137[3] = CFSTR("inputUseMetal");
    v138[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v92 = (void *)objc_msgSend(v92, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurNoise"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 4));
    -[CIImage extent](inputImage, "extent");
    saveImage((CIImage *)objc_msgSend(v92, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/blur-NoiseAddedFullRes-CI.tiff"), 0);
  }
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v96 = v95;
  SDOFRenderingValue(CFSTR("sharpRadius"), self->inputTuningParameters);
  v98 = v97;
  SDOFRenderingValue(CFSTR("softRadius"), self->inputTuningParameters);
  v100 = v99;
  -[CIImage extent](inputImage, "extent");
  v102 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v96, v98, v100, v101);
  if (v3)
    v103 = -[CIPortraitBlur _ourBlendKernelMetal](self, "_ourBlendKernelMetal");
  else
    v103 = -[CIPortraitBlur _ourBlendKernel](self, "_ourBlendKernel");
  v104 = v103;
  if (!v103)
    v104 = -[CIPortraitBlur _ourBlendKernel](self, "_ourBlendKernel");
  -[CIImage extent](self->inputImage, "extent");
  v136[0] = self->inputImage;
  v136[1] = v92;
  v136[2] = v102;
  v109 = (void *)objc_msgSend(v104, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 3), v105, v106, v107, v108);
  -[CIImage extent](self->inputImage, "extent");
  saveImage((CIImage *)objc_msgSend(v109, "imageByCroppingToRect:"), (uint64_t)CFSTR("/tmp/finalBlend.tiff"), 0);
  _Block_object_dispose(v132, 8);
  return v109;
}

double __30__CIPortraitBlur_outputImage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5;
  double result;

  v5 = -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

double __30__CIPortraitBlur_outputImage___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGFloat v5;
  double result;

  v5 = -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v5, v5);
  return result;
}

- (id)outputImageV2
{
  id v3;
  id v5;

  v3 = -[CIPortraitBlur outputImage:](self, "outputImage:", 0);
  if (-[CIPortraitBlur outputImageV2]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlur outputImageV2]::onceToken, &__block_literal_global_197);
  if (-[CIPortraitBlur outputImageV2]::disableHandWrittenMetal)
    return v3;
  v5 = -[CIPortraitBlur outputImage:](self, "outputImage:", 1);
  if (!v5)
    return v3;
  else
    return +[CIImage imageForRenderingWithMetal:orNonMetal:](CIImage, "imageForRenderingWithMetal:orNonMetal:", v5, v3);
}

uint64_t __31__CIPortraitBlur_outputImageV2__block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_DISABLE_PORTRAIT_METAL");
  if (v0)
    result = atoi(v0);
  else
    result = -[CIPortraitBlur outputImageV2]::disableHandWrittenMetal;
  -[CIPortraitBlur outputImageV2]::disableHandWrittenMetal = (_DWORD)result != 0;
  return result;
}

- (id)outputImageV3
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = +[CIFilter metalFilterWithName:](CIFilter, "metalFilterWithName:", CFSTR("CIPortraitBlurV2"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CIFilter inputKeys](self, "inputKeys", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setValue:forKey:", -[CIPortraitBlur valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return (id)objc_msgSend(v3, "outputImage");
}

- (id)outputImage
{
  NSDictionary *inputTuningParameters;
  id v4;

  if (-[CIPortraitBlur outputImage]::onceTokenNP != -1)
    dispatch_once(&-[CIPortraitBlur outputImage]::onceTokenNP, &__block_literal_global_202);
  if (-[CIPortraitBlur outputImage]::enableNewPortraitCodePath
    && (inputTuningParameters = self->inputTuningParameters) != 0
    && (v4 = -[NSDictionary objectForKeyedSubscript:](inputTuningParameters, "objectForKeyedSubscript:", CFSTR("Version"))) != 0&& (objc_msgSend(v4, "integerValue") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    return -[CIPortraitBlur outputImageV3](self, "outputImageV3");
  }
  else
  {
    return -[CIPortraitBlur outputImageV2](self, "outputImageV2");
  }
}

uint64_t __29__CIPortraitBlur_outputImage__block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_ENABLE_NEW_PORTRAIT");
  if (v0)
    result = atoi(v0);
  else
    result = -[CIPortraitBlur outputImage]::enableNewPortraitCodePath;
  -[CIPortraitBlur outputImage]::enableNewPortraitCodePath = (_DWORD)result != 0;
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
