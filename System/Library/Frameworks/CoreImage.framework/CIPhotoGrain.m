@implementation CIPhotoGrain

- (id)_interpolateGrainKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_blendGrains);
}

- (id)_grainBlendAndMixKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_grainBlendAndMix);
}

- (id)_paddedTileKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_paddedTile2);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[7];
  _QWORD v10[4];
  _QWORD v11[6];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryNonSquarePixels");
  v9[4] = CFSTR("CICategoryStillImage");
  v9[5] = CFSTR("CICategoryBuiltIn");
  v9[6] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v10[1] = CFSTR("inputISO");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A6C0;
  v8[1] = &unk_1E2F1A6C0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1A6D0;
  v8[3] = &unk_1E2F1A6C0;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1A6E0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[2] = CFSTR("inputAmount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A6E0;
  v6[1] = &unk_1E2F1A6E0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A6F0;
  v6[3] = &unk_1E2F1A6F0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1A6E0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[3] = CFSTR("inputSeed");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A6E0;
  v4[1] = &unk_1E2F1A6E0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A6F0;
  v4[3] = &unk_1E2F1A6E0;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
}

- (id)outputImage
{
  float v3;
  float v5;
  float v6;
  float v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  float v39;
  float v40;
  CIImage *v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  NSNumber *inputAmount;
  double v53;
  double v54;
  float v55;
  float v56;
  CGAffineTransform v57;
  int64x2_t v58[5];
  double __src;
  _QWORD v60[8];
  CGAffineTransform v61;
  _QWORD block[5];
  _QWORD v63[4];
  CIVector *v64;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  if (v3 < 0.001)
    return self->inputImage;
  -[NSNumber floatValue](self->inputISO, "floatValue");
  v6 = fminf(fmaxf(v5, 10.0), 3200.0);
  v7 = log10f(v6);
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CIPhotoGrain_outputImage__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = self;
  if (-[CIPhotoGrain outputImage]::onceToken != -1)
    dispatch_once(&-[CIPhotoGrain outputImage]::onceToken, block);
  v9 = (void *)-[CIPhotoGrain outputImage]::inputGrain;
  if (!-[CIPhotoGrain outputImage]::inputGrain)
    return 0;
  v55 = v6;
  CGAffineTransformMakeTranslation(&v61, -1.0, -1.0);
  v10 = (void *)objc_msgSend(v9, "imageByApplyingTransform:", &v61);
  v11 = -[CIPhotoGrain _interpolateGrainKernel](self, "_interpolateGrainKernel");
  objc_msgSend(v10, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v65[0] = v10;
  v56 = v7;
  *(float *)&v12 = v7;
  v65[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v20 = (void *)objc_msgSend(v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2), v13, v15, v17, v19);
  objc_msgSend(v20, "extent");
  v22 = v21 + -2.0;
  objc_msgSend(v20, "extent");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = -[CIPhotoGrain _paddedTileKernel](self, "_paddedTileKernel");
  v32 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v53 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v54 = *MEMORY[0x1E0C9D5E0];
  v33 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v60[0] = v8;
  v60[1] = 3221225472;
  v60[2] = __27__CIPhotoGrain_outputImage__block_invoke_2;
  v60[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v60[4] = v24;
  v60[5] = v26;
  v60[6] = v28;
  v60[7] = v30;
  v64 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v22, v22, 1.0 / v22, 1.0 / v22);
  v34 = (void *)objc_msgSend(v31, "applyWithExtent:roiCallback:inputImage:arguments:", v60, v20, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1), v54, v53, v32, v33);
  -[NSNumber doubleValue](self->inputSeed, "doubleValue");
  __src = v35;
  if (v35 != 0.0)
  {
    XXH64_reset(v58, 0);
    XXH64_update((uint64_t)v58, (char *)&__src, 8uLL);
    v36 = XXH64_digest((uint64_t)v58);
    CGAffineTransformMakeTranslation(&v57, (double)(v36 & 0x1FF), (double)((v36 >> 9) & 0x1FF));
    v34 = (void *)objc_msgSend(v34, "imageByApplyingTransform:", &v57);
  }
  if (v55 < 400.0)
    v37 = 1;
  else
    v37 = 2;
  if (v55 >= 50.0)
    v38 = v37;
  else
    v38 = 0;
  v39 = log10f(flt_1924969F0[v38]);
  v40 = fmaxf(flt_192496A00[v38]+ (float)((float)(flt_192496A00[v38 + 1] - flt_192496A00[v38])* (float)((float)(v56 - v39) / (float)(log10f(flt_1924969F0[v38 + 1]) - v39))), 0.2);
  v41 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v42 = -[CIPhotoGrain _grainBlendAndMixKernel](self, "_grainBlendAndMixKernel");
  -[CIImage extent](v41, "extent");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v63[0] = v41;
  v63[1] = v34;
  *(float *)&v43 = v40;
  v51 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
  inputAmount = self->inputAmount;
  v63[2] = v51;
  v63[3] = inputAmount;
  return (id)objc_msgSend((id)objc_msgSend(v42, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4), v44, v46, v48, v50), "imageByPremultiplyingAlpha");
}

id __27__CIPhotoGrain_outputImage__block_invoke()
{
  id result;
  uint64_t v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("noiseImage"), CFSTR("rgba"));
  if (result)
  {
    v1 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", result, 8, 0);
    v2 = CFSTR("CIImageColorSpace");
    v3[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    -[CIPhotoGrain outputImage]::inputGrain = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v1, 2080, 264, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1), 514.0, 514.0);
    return (id)-[CIPhotoGrain outputImage]::inputGrain;
  }
  return result;
}

double __27__CIPhotoGrain_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputISO
{
  return self->inputISO;
}

- (void)setInputISO:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
