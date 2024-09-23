@implementation CIColorCube

- (void)dealloc
{
  objc_super v3;

  self->_cubeImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIColorCube;
  -[CIFilter dealloc](&v3, sel_dealloc);
}

- (void)setInputCubeData:(id)a3
{
  NSData *v5;

  self->_cubeImage = 0;
  v5 = self->inputCubeData;
  self->inputCubeData = (NSData *)a3;
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryNonSquarePixels");
  v9[4] = CFSTR("CICategoryStillImage");
  v9[5] = CFSTR("CICategoryHighDynamicRange");
  v9[6] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v11[1] = CFSTR("5");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputCubeDimension");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F1B4E8;
  v8[1] = &unk_1E2F1B500;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeIdentity");
  v8[2] = &unk_1E2F1B4E8;
  v8[3] = &unk_1E2F1B4E8;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeCount");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[4] = CFSTR("inputCubeData");
  v5[0] = CFSTR("CIAttributeDefault");
  if (defaultCube(void)::onceToken != -1)
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  v5[1] = CFSTR("CIAttributeIdentity");
  v6[0] = defaultCube(void)::data;
  v6[1] = defaultCube(void)::data;
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[5] = CFSTR("inputExtrapolate");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorcube);
}

- (id)_kernelOpaque
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorcubeopaque);
}

- (id)_kernelOpaqueExtend
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorcubeopaque_extend);
}

- (id)cubeImage
{
  id result;
  int v4;
  int v5;
  int v6;
  size_t v7;
  size_t v8;
  NSData *inputCubeData;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  CIImage *v16;
  _QWORD v17[6];
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[7];

  v23[5] = *MEMORY[0x1E0C80C00];
  result = self->_cubeImage;
  if (!result)
  {
    v4 = -[NSNumber intValue](self->inputCubeDimension, "intValue");
    v5 = -[NSData length](self->inputCubeData, "length");
    v6 = v4;
    v7 = 4 * v4;
    v8 = 16 * v4;
    if (v4 * (uint64_t)v4 * v8 == v5)
    {
      inputCubeData = (NSData *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (uint64_t)v5 >> 2);
      v10 = (void *)-[NSData mutableBytes](inputCubeData, "mutableBytes");
      src.data = (void *)-[NSData bytes](self->inputCubeData, "bytes");
      src.height = (v6 * v6);
      src.width = 4 * v6;
      src.rowBytes = v8;
      dest.data = v10;
      dest.height = src.height;
      dest.width = src.width;
      dest.rowBytes = v7;
      vImageConvert_PlanarFtoPlanar8(&src, &dest, 1.0, 0.0, 0);
    }
    else
    {
      inputCubeData = self->inputCubeData;
    }
    v11 = -[NSData bytes](inputCubeData, "bytes");
    if (-[NSData length](inputCubeData, "length"))
    {
      v12 = 0;
      v13 = v11 + 3;
      v14 = 1;
      do
      {
        v14 &= ~*(_BYTE *)(v13 + v12) == 0;
        v12 += 4;
      }
      while (-[NSData length](inputCubeData, "length") > v12);
    }
    v22[0] = CFSTR("kCIImageProviderContentDigest");
    v22[1] = CFSTR("kCIImageProviderName");
    v23[0] = inputCubeData;
    v23[1] = CFSTR("CIColorCube");
    v22[2] = CFSTR("CIImageFlipped");
    v22[3] = CFSTR("CIImageClampToEdge");
    v15 = MEMORY[0x1E0C9AAB0];
    v23[2] = MEMORY[0x1E0C9AAA0];
    v23[3] = MEMORY[0x1E0C9AAB0];
    v22[4] = CFSTR("kCIImageCacheHint");
    v23[4] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
    v20[0] = CFSTR("kCIImageProviderContentDigest");
    v20[1] = CFSTR("kCIImageProviderName");
    v21[0] = inputCubeData;
    v21[1] = CFSTR("CIColorCube");
    v20[2] = CFSTR("CIImageFlipped");
    v20[3] = CFSTR("CIImageClampToEdge");
    v21[2] = MEMORY[0x1E0C9AAA0];
    v21[3] = v15;
    v20[4] = CFSTR("kCIImageCacheHint");
    v20[5] = CFSTR("kCIImageAlphaOne");
    v21[4] = v15;
    v21[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
    v16 = [CIImage alloc];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __24__CIColorCube_cubeImage__block_invoke;
    v17[3] = &unk_1E2EC2F80;
    v17[4] = inputCubeData;
    v17[5] = v7;
    result = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](v16, "initWithImageProvider:width:height:format:colorSpace:options:", v17);
    self->_cubeImage = (CIImage *)result;
  }
  return result;
}

uint64_t __24__CIColorCube_cubeImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;

  result = objc_msgSend(*(id *)(a1 + 32), "bytes");
  if (a7)
  {
    v13 = 0;
    v14 = (_BYTE *)(a2 + 1);
    do
    {
      if (a6)
      {
        v15 = (_BYTE *)(result + 1 + *(_QWORD *)(a1 + 40) * v13);
        v16 = v14;
        v17 = a6;
        do
        {
          v16[1] = *(v15 - 1);
          *v16 = *v15;
          *(v16 - 1) = v15[1];
          v16[2] = v15[2];
          v15 += 4;
          v16 += 4;
          --v17;
        }
        while (v17);
      }
      ++v13;
      v14 += a3;
    }
    while (v13 != a7);
  }
  return result;
}

- (BOOL)_checkInputs
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = -[NSNumber intValue](self->inputCubeDimension, "intValue");
  if ((v3 - 65) > 0xFFFFFFC0)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (4 * v4 * v4 * v4);
      if (-[NSData length](self->inputCubeData, "length") == 4 * v5
        || -[NSData length](self->inputCubeData, "length") == v5)
      {
        return 1;
      }
      NSLog(CFSTR("CIColorCube inputCubeData is not of the expected length."));
    }
    else
    {
      NSLog(CFSTR("CIColorCube inputCubeData must be of type NSData."));
    }
  }
  else
  {
    NSLog(CFSTR("CIColorCube inputCubeDimension must be from 2 through %d."), 64);
  }
  return 0;
}

- (id)outputImage
{
  CIImage *v3;
  int v4;
  CIVector *v5;
  id v6;
  id v7;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !-[CIColorCube _checkInputs](self, "_checkInputs"))
    return 0;
  v3 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v4 = -[NSNumber intValue](self->inputCubeDimension, "intValue");
  v5 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (double)v4 + -1.0, 1.0 / ((double)v4 + -1.0), 1.0 / (double)v4, 1.0 / (double)(v4 * v4));
  v6 = -[CIColorCube cubeImage](self, "cubeImage");
  if (objc_msgSend(v6, "isOpaque"))
    v7 = -[CIColorCube _kernelOpaque](self, "_kernelOpaque");
  else
    v7 = -[CIColorCube _kernel](self, "_kernel");
  v9 = v7;
  if (-[NSNumber BOOLValue](self->inputExtrapolate, "BOOLValue"))
  {
    if (objc_msgSend(v6, "isOpaque"))
      v9 = -[CIColorCube _kernelOpaqueExtend](self, "_kernelOpaqueExtend");
    else
      v9 = 0;
  }
  -[CIImage extent](v3, "extent");
  v14[0] = v3;
  v14[1] = v6;
  v14[2] = v5;
  return (id)objc_msgSend((id)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3), v10, v11, v12, v13), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputCubeDimension
{
  return self->inputCubeDimension;
}

- (void)setInputCubeDimension:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSData)inputCubeData
{
  return self->inputCubeData;
}

- (NSNumber)inputExtrapolate
{
  return self->inputExtrapolate;
}

- (void)setInputExtrapolate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
