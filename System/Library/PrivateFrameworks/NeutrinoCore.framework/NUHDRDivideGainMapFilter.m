@implementation NUHDRDivideGainMapFilter

+ (id)lightMapLogDivideKernel
{
  if (lightMapLogDivideKernel_once != -1)
    dispatch_once(&lightMapLogDivideKernel_once, &__block_literal_global_144);
  return (id)lightMapLogDivideKernel_s_lightMapDivideKernel;
}

+ (id)lightMapLogDivideRGBKernel
{
  if (lightMapLogDivideRGBKernel_once != -1)
    dispatch_once(&lightMapLogDivideRGBKernel_once, &__block_literal_global_147);
  return (id)lightMapLogDivideRGBKernel_s_lightMapDivideRGBKernel;
}

+ (id)lightMapDivideKernel
{
  if (lightMapDivideKernel_once != -1)
    dispatch_once(&lightMapDivideKernel_once, &__block_literal_global_150);
  return (id)lightMapDivideKernel_s_lightMapDivideKernel;
}

+ (id)lightMapDivideRGBKernel
{
  if (lightMapDivideRGBKernel_once != -1)
    dispatch_once(&lightMapDivideRGBKernel_once, &__block_literal_global_153);
  return (id)lightMapDivideRGBKernel_s_lightMapDivideRGBKernel;
}

void __51__NUHDRDivideGainMapFilter_lightMapDivideRGBKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 lightMapDivideRGB(__sample im, __sample lm) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float iml = dot(im.rgb, weq); \n  float imx = max(max(im.r, im.g), im.b); \n  float luma = 0.5 * (iml + imx); \n  float lml = dot(lm.rgb, weq); \n  float lmx = max(max(lm.r, lm.g), lm.b); \n  float light = 0.5 * (lml + lmx); \n  light = min(light, luma); \n  const float e = 0.01; \n  luma = (1 - e) * luma + e; \n  float gain = light/luma; \n  gain = (gain - e)/(1 - e); \n  return vec4(gain, gain, gain, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lightMapDivideRGBKernel_s_lightMapDivideRGBKernel;
  lightMapDivideRGBKernel_s_lightMapDivideRGBKernel = v0;

}

void __48__NUHDRDivideGainMapFilter_lightMapDivideKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 lightMapDivide(__sample im, __sample lm) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  float light = lm.r; \n  light = min(light, luma); \n  const float e = 0.01; \n  luma = (1.f - e) * luma + e; \n  float gain = light/luma; \n  gain = (gain - e)/(1.f - e); \n  return vec4(gain, gain, gain, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lightMapDivideKernel_s_lightMapDivideKernel;
  lightMapDivideKernel_s_lightMapDivideKernel = v0;

}

void __54__NUHDRDivideGainMapFilter_lightMapLogDivideRGBKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 lightMapDivideRGB(__sample im, __sample lm, float2 a) \n{ \n  float3 color = log2(1.0 + im.rgb); \n  float3 light = log2(1.0 + lm.rgb); \n  float3 glog2 = a.x * light + a.y * color; \n  float3 gain = exp2(glog2) - 1.0; \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float g = dot(gain, weq); \n  return vec4(g, g, g, 1.0); \n }\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lightMapLogDivideRGBKernel_s_lightMapDivideRGBKernel;
  lightMapLogDivideRGBKernel_s_lightMapDivideRGBKernel = v0;

}

void __51__NUHDRDivideGainMapFilter_lightMapLogDivideKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 lightMapDivide(__sample im, __sample lm, float2 a) \n{ \n  const float3 weq = float3(1.0/3.0, 1.0/3.0, 1.0/3.0); \n  float luma = dot(im.rgb, weq); \n  float maxRGB = max(max(im.r, im.g), im.b); \n  luma = 0.5 * (luma + maxRGB); \n  luma = log2(1.0 + luma); \n  float light = dot(lm.rgb, weq); \n  light = log2(1.0 +light); \n  float glog2 = a.x * light + a.y * luma; \n  float g = exp2(glog2) - 1.0; \n  return vec4(g, g, g, 1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)lightMapLogDivideKernel_s_lightMapDivideKernel;
  lightMapLogDivideKernel_s_lightMapDivideKernel = v0;

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
  void *v22;
  float v23;
  void *v24;
  void *v25;
  CGAffineTransform v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  -[NUHDRDivideGainMapFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHDRDivideGainMapFilter inputLightMap](self, "inputLightMap");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    -[NUHDRDivideGainMapFilter inputPreserveColor](self, "inputPreserveColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    -[NUHDRDivideGainMapFilter inputMixFactor](self, "inputMixFactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    v12 = (void *)objc_opt_class();
    if (v11 == 0.0)
    {
      if (v8)
        objc_msgSend(v12, "lightMapDivideRGBKernel");
      else
        objc_msgSend(v12, "lightMapDivideKernel");
    }
    else if (v8)
    {
      objc_msgSend(v12, "lightMapLogDivideRGBKernel");
    }
    else
    {
      objc_msgSend(v12, "lightMapLogDivideKernel");
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
    v22 = (void *)v21;
    if (v11 == 0.0)
    {
      v28[0] = v21;
      v28[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = fmaxf(fminf(1.0 - v11, 1.0), 0.0);
      v29[0] = v21;
      v29[1] = v5;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDF8]), "initWithX:Y:", (float)(1.0 / (float)(1.0 - v23)), (float)((float)-v23 / (float)(1.0 - v23)));
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

- (CIImage)inputLightMap
{
  return self->_inputLightMap;
}

- (void)setInputLightMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputLightMap, a3);
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
  objc_storeStrong((id *)&self->_inputLightMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
