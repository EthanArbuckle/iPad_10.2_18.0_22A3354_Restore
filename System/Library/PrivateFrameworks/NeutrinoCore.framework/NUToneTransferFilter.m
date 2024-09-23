@implementation NUToneTransferFilter

+ (id)toneTransferKernel
{
  if (toneTransferKernel_once != -1)
    dispatch_once(&toneTransferKernel_once, &__block_literal_global_506);
  return (id)toneTransferKernel_s_toneTransferKernel;
}

void __42__NUToneTransferFilter_toneTransferKernel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 toneTransfer(__sample im, __sample src, __sample dst, float f) \n{ \n  float epsilon = 1e-5; \n  vec3 y0 = src.rgb; \n  vec3 y1 = dst.rgb; \n  vec3 g = (y1 + epsilon) / (y0 + epsilon); \n  vec3 x = im.rgb; \n  vec3 y = mix(x, g * x, f); \n  return vec4(y, im.a); \n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)toneTransferKernel_s_toneTransferKernel;
  toneTransferKernel_s_toneTransferKernel = v0;

}

- (id)outputImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[NUToneTransferFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NUToneTransferFilter inputSourceImage](self, "inputSourceImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUToneTransferFilter inputTargetImage](self, "inputTargetImage");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      -[NUToneTransferFilter inputStrength](self, "inputStrength");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = &unk_1E50A3728;
      if (v7)
        v9 = (void *)v7;
      v10 = v9;

      objc_msgSend((id)objc_opt_class(), "toneTransferKernel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "extent");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v23[0] = v3;
      v23[1] = v4;
      v23[2] = v6;
      v23[3] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "applyWithExtent:arguments:", v20, v13, v15, v17, v19);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v3;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputSourceImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSourceImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputTargetImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputTargetImage, 0);
  objc_storeStrong((id *)&self->_inputSourceImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
