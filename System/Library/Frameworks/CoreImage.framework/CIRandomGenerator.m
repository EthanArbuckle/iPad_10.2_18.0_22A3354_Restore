@implementation CIRandomGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_paddedTile);
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryGenerator");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("6");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v19;
  _QWORD v20[8];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIImage noiseImagePadded](CIImage, "noiseImagePadded");
  objc_msgSend(v3, "extent");
  v5 = v4 + -2.0;
  objc_msgSend(v3, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CIRandomGenerator _kernel](self, "_kernel");
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v19 = *MEMORY[0x1E0C9D5E0];
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__CIRandomGenerator_outputImage__block_invoke;
  v20[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v20[4] = v7;
  v20[5] = v9;
  v20[6] = v11;
  v20[7] = v13;
  v21[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v5, v5, 1.0 / v5, 1.0 / v5);
  return (id)objc_msgSend(v14, "applyWithExtent:roiCallback:inputImage:arguments:", v20, v3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1), v19, v15, v17, v16);
}

double __32__CIRandomGenerator_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

@end
