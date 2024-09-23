@implementation NURAWGainMapFilter

+ (id)gainMapKernel
{
  if (gainMapKernel_once != -1)
    dispatch_once(&gainMapKernel_once, &__block_literal_global_472);
  return (id)gainMapKernel_s_gainMapKernel;
}

void __35__NURAWGainMapFilter_gainMapKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _gainMap(__sample im, float gainCompensation) \n{ \n  vec3 stopDown = 0.25 * gainCompensation * im.rgb; \n  float y = dot(stopDown, vec3(0.299, 0.587, 0.114)); \n  y = smoothstep(0.0, 1.0, sqrt(clamp(y, 0.0, 4.0))); \n  return vec4(y,y,y,1.0); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gainMapKernel_s_gainMapKernel;
  gainMapKernel_s_gainMapKernel = v0;

}

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[NURAWGainMapFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURAWGainMapFilter inputGain](self, "inputGain");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &unk_1E50A3728;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "gainMapKernel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v21[0] = v3;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "applyWithExtent:arguments:", v17, v10, v12, v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "_imageByApplyingGamma:", 2.2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputGain
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputGain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputGain, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
