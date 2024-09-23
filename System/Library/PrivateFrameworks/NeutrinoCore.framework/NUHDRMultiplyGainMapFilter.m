@implementation NUHDRMultiplyGainMapFilter

+ (id)gainMapLogMultiplyKernel
{
  if (gainMapLogMultiplyKernel_once != -1)
    dispatch_once(&gainMapLogMultiplyKernel_once, &__block_literal_global_107);
  return (id)gainMapLogMultiplyKernel_s_gainMapLogMultiplyKernel;
}

+ (id)gainMapLogMultiplyRGBKernel
{
  if (gainMapLogMultiplyRGBKernel_once != -1)
    dispatch_once(&gainMapLogMultiplyRGBKernel_once, &__block_literal_global_110);
  return (id)gainMapLogMultiplyRGBKernel_s_gainMapLogMultiplyRGBKernel;
}

+ (id)gainMapMultiplyKernel
{
  if (gainMapMultiplyKernel_once != -1)
    dispatch_once(&gainMapMultiplyKernel_once, &__block_literal_global_113);
  return (id)gainMapMultiplyKernel_s_gainMapMultiplyKernel;
}

+ (id)gainMapMultiplyRGBKernel
{
  if (gainMapMultiplyRGBKernel_once != -1)
    dispatch_once(&gainMapMultiplyRGBKernel_once, &__block_literal_global_116);
  return (id)gainMapMultiplyRGBKernel_s_gainMapMultiplyRGBKernel;
}

void __54__NUHDRMultiplyGainMapFilter_gainMapMultiplyRGBKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 gainMapMultiplyRGB(__sample im, __sample gm) \n{ \n  const float e = 0.01; \n  float3 color = (1 - e) * im.rgb + e; \n  float3 gain = (1 - e) * gm.rgb + e; \n  float3 light = gain * color; \n  return vec4(light, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gainMapMultiplyRGBKernel_s_gainMapMultiplyRGBKernel;
  gainMapMultiplyRGBKernel_s_gainMapMultiplyRGBKernel = v0;

}

void __51__NUHDRMultiplyGainMapFilter_gainMapMultiplyKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 gainMapMultiply(__sample im, __sample gm) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  float gain = gm.r; \n  const float e = 0.01; \n  luma = (1 - e) * luma + e; \n  gain = (1 - e) * gain + e; \n  float light = gain * luma; \n  return vec4(light, light, light, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gainMapMultiplyKernel_s_gainMapMultiplyKernel;
  gainMapMultiplyKernel_s_gainMapMultiplyKernel = v0;

}

void __57__NUHDRMultiplyGainMapFilter_gainMapLogMultiplyRGBKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 gainMapMultiplyRGB(__sample im, __sample gm, float f) \n{ \n  float3 color = log2(1.0 + im.rgb); \n  float3 gain = log2(1.0 + gm.rgb); \n  float3 light = mix(gain, color, f); \n  light = exp2(light) - 1.0; \n  return vec4(light, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gainMapLogMultiplyRGBKernel_s_gainMapLogMultiplyRGBKernel;
  gainMapLogMultiplyRGBKernel_s_gainMapLogMultiplyRGBKernel = v0;

}

void __54__NUHDRMultiplyGainMapFilter_gainMapLogMultiplyKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 gainMapMultiply(__sample im, __sample gm, float f) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  luma = log2(1.0 + luma); \n  float gain = log2(1.0 + gm.r); \n  float light = mix(gain, luma, f); \n  light = exp2(light) - 1.0; \n  return vec4(light, light, light, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gainMapLogMultiplyKernel_s_gainMapLogMultiplyKernel;
  gainMapLogMultiplyKernel_s_gainMapLogMultiplyKernel = v0;

}

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  CGAffineTransform v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  -[NUHDRMultiplyGainMapFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHDRMultiplyGainMapFilter inputGainMap](self, "inputGainMap");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    -[NUHDRMultiplyGainMapFilter inputPreserveColor](self, "inputPreserveColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    -[NUHDRMultiplyGainMapFilter inputMixFactor](self, "inputMixFactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v12 = (void *)objc_opt_class();
    if (v11 == 0.0)
    {
      if (v8)
        objc_msgSend(v12, "gainMapMultiplyRGBKernel");
      else
        objc_msgSend(v12, "gainMapMultiplyKernel");
    }
    else if (v8)
    {
      objc_msgSend(v12, "gainMapLogMultiplyRGBKernel");
    }
    else
    {
      objc_msgSend(v12, "gainMapLogMultiplyKernel");
    }
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    objc_msgSend(v5, "extent");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v3, "extent");
    CGAffineTransformMakeScale(&v27, v16 / v19, v18 / v20);
    objc_msgSend(v3, "imageByApplyingTransform:", &v27);
    v21 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v21;
    if (v11 == 0.0)
    {
      v28[0] = v21;
      v28[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *(float *)&v22 = fmaxf(fminf(1.0 - v11, 1.0), 0.0);
      v29[0] = v21;
      v29[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "extent");
    objc_msgSend(v14, "applyWithExtent:arguments:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputGainMap, a3);
}

- (NSNumber)inputPreserveColor
{
  return self->_inputPreserveColor;
}

- (void)setInputPreserveColor:(id)a3
{
  objc_storeStrong((id *)&self->_inputPreserveColor, a3);
}

- (NSNumber)inputMixFactor
{
  return self->_inputMixFactor;
}

- (void)setInputMixFactor:(id)a3
{
  objc_storeStrong((id *)&self->_inputMixFactor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMixFactor, 0);
  objc_storeStrong((id *)&self->_inputPreserveColor, 0);
  objc_storeStrong((id *)&self->_inputGainMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
