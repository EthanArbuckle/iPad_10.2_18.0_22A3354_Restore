@implementation CILumaMap

- (void)dealloc
{
  CIImage *tableImage;
  objc_super v4;

  tableImage = self->_tableImage;
  if (tableImage)

  v4.receiver = self;
  v4.super_class = (Class)CILumaMap;
  -[CIFilter dealloc](&v4, sel_dealloc);
}

+ (id)customAttributes
{
  return 0;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lumaMap);
}

- (void)setDefaults
{
  self->_tableImage = 0;
}

- (const)lumaTable
{
  return 0;
}

- (id)outputImage
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  CIImage *tableImage;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    if (!self->_tableImage)
    {
      v14[0] = CFSTR("CIImageColorSpace");
      v15[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15[1] = MEMORY[0x1E0C9AAA0];
      v14[1] = CFSTR("CIImageFlipped");
      v14[2] = CFSTR("CIImageClampToEdge");
      v15[2] = MEMORY[0x1E0C9AAB0];
      v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[CILumaMap lumaTable](self, "lumaTable"), 1024, 0);
      self->_tableImage = +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v5, objc_msgSend(v5, "length"), 266, v4, 256.0, 1.0);
      result = self->inputImage;
    }
    v6 = objc_msgSend(result, "imageByUnpremultiplyingAlpha");
    v7 = -[CILumaMap _kernel](self, "_kernel");
    -[CIImage extent](self->inputImage, "extent");
    tableImage = self->_tableImage;
    v13[0] = v6;
    v13[1] = tableImage;
    return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_46, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2), v9, v10, v11, v12), "imageByPremultiplyingAlpha");
  }
  return result;
}

double __24__CILumaMap_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2 == 1)
    return 0.0;
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
