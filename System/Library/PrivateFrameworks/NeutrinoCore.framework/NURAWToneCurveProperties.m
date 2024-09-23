@implementation NURAWToneCurveProperties

void __53___NURAWToneCurveProperties__generateGainMapExposure__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithString:", CFSTR("kernel vec4 _synthGainInput(float y) \n{ \n  return vec4(y,y,y,1.0);\n}\n"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_generateGainMapExposure_s_synthGainInputKernel;
  _generateGainMapExposure_s_synthGainInputKernel = v0;

  v2 = (void *)MEMORY[0x1E0C9DD90];
  v3 = *MEMORY[0x1E0C9DF88];
  v7[0] = *MEMORY[0x1E0C9DF58];
  v7[1] = v3;
  v8[0] = MEMORY[0x1E0C9AAA0];
  v8[1] = CFSTR("SyntheticGainMapSearch");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextWithOptions:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_generateGainMapExposure_ctx;
  _generateGainMapExposure_ctx = v5;

}

@end
