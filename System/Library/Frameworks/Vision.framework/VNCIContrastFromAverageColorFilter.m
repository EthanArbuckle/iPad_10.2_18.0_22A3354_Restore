@implementation VNCIContrastFromAverageColorFilter

- (VNCIContrastFromAverageColorFilter)init
{
  VNCIContrastFromAverageColorFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNCIContrastFromAverageColorFilter;
  result = -[VNCIFilter initWithKernelName:](&v3, sel_initWithKernelName_, CFSTR("contrastFromAverage"));
  if (result)
  {
    if (!result->_inputContrast)
      result->_inputContrast = (NSNumber *)&unk_1E459E528;
  }
  return result;
}

- (VNCIContrastFromAverageColorFilter)initWithInputParameters:(id)a3
{
  VNCIContrastFromAverageColorFilter *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCIContrastFromAverageColorFilter;
  result = -[VNCIFilter initWithKernelName:inputParameters:](&v4, sel_initWithKernelName_inputParameters_, CFSTR("contrastFromAverage"), a3);
  if (result)
  {
    if (!result->_inputContrast)
      result->_inputContrast = (NSNumber *)&unk_1E459E528;
  }
  return result;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[VNCIFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCIContrastFromAverageColorFilter inputContrast](self, "inputContrast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  if (v6 == 1.0)
  {
    v7 = v3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1B0B060]();
    v19 = *MEMORY[0x1E0C9E1F0];
    v9 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v3, "extent");
    objc_msgSend(v9, "vectorWithCGRect:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "imageByClampingToExtent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "imageByUnpremultiplyingAlpha");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v14;
    -[VNCIContrastFromAverageColorFilter inputContrast](self, "inputContrast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v16);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (NSNumber)inputContrast
{
  return self->_inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputContrast, 0);
}

@end
