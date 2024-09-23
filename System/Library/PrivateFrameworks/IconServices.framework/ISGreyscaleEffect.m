@implementation ISGreyscaleEffect

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v5;
  void *v6;
  ISBiasedGrayscaleConversion *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  float v22;

  v20 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1AF423108]();
  v7 = objc_alloc_init(ISBiasedGrayscaleConversion);
  v22 = 0.0;
  v21 = 0;
  if (-[ISGrayscaleConversion computeGrayscaleConversionColorWithCGImage:grayscaleConversion:](v7, "computeGrayscaleConversionColorWithCGImage:grayscaleConversion:", objc_msgSend(v5, "CGImage"), &v21))
  {
    v8 = *(float *)&v21;
    v9 = *((float *)&v21 + 1);
    v10 = v22;
  }
  else
  {
    v8 = 0.2126;
    v9 = 0.7152;
    v10 = 0.0722;
  }
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", v8, v9, v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILinearToSRGBToneCurve"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v13, "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorMatrix"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "outputImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v16, v14);

  objc_msgSend(v15, "setValue:forKey:", v11, CFSTR("inputRVector"));
  objc_msgSend(v15, "setValue:forKey:", v11, CFSTR("inputGVector"));
  objc_msgSend(v15, "setValue:forKey:", v11, CFSTR("inputBVector"));
  objc_msgSend(v15, "setValue:forKey:", v12, CFSTR("inputAVector"));

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISRGBToneCurveToLinear"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forKey:", v18, v14);

  objc_autoreleasePoolPop(v6);
  return v17;
}

@end
