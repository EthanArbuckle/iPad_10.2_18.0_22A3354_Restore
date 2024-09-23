@implementation CIHighlightRecovery

- (id)outputImage
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSString *v9;
  void *v10;
  void *v11;
  NSNumber *inputScale;
  float v13;
  float v14;
  CIImage *inputImage;
  float v17;
  NSInteger v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  NSNumber *inputApertureScaling;
  float v24;
  double v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  double v31;
  float v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[7];
  _QWORD v38[7];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(&unk_1E2F1DCD8, "count") + 1);
  v4 = -[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("HighlightRecovery"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = objc_msgSend(&unk_1E2F1DCD8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(&unk_1E2F1DCD8);
        v9 = *(NSString **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!objc_msgSend(v4, "valueForKey:", v9))
        {
          NSLog(CFSTR("Required parameter %@ is not specified."), v9);
          return 0;
        }
        v10 = (void *)MEMORY[0x1E0CB37E8];
        SDOFHighlightRecoveryValue(v9, self->inputTuningParameters);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v10, "numberWithFloat:"), v9);
      }
      v6 = objc_msgSend(&unk_1E2F1DCD8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v11, "numberWithFloat:"), CFSTR("maxBlur"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->inputApertureScaling, CFSTR("apertureScaling"));
  inputScale = self->inputScale;
  if (inputScale)
  {
    -[NSNumber floatValue](inputScale, "floatValue");
    v14 = v13;
  }
  else
  {
    v14 = 1.0;
  }
  v17 = roundf(v14* (float)(int)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iterations")), "intValue"));
  v18 = -[NSNumber integerValue](-[CIHighlightRecovery inputDraftMode](self, "inputDraftMode"), "integerValue");
  if (v18 == 1)
  {
    v17 = roundf(v17 / 3.0);
  }
  else if (v18 == 2)
  {
    v17 = (float)(int)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iterations")), "intValue");
  }
  *(float *)&v19 = v17;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19), CFSTR("iterations"));
  inputImage = self->inputImage;
  if (v17 != 0.0)
  {
    v37[0] = CFSTR("inputIterations");
    *(float *)&v20 = v17;
    v38[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v37[1] = CFSTR("inputScale");
    *(float *)&v21 = v14;
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    inputApertureScaling = self->inputApertureScaling;
    v38[1] = v22;
    v38[2] = inputApertureScaling;
    v37[2] = CFSTR("inputApertureScaling");
    v37[3] = CFSTR("inputMaxBlur");
    v38[3] = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxBlur"));
    v37[4] = CFSTR("inputBlurRadius");
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blurRadiusT0")), "floatValue");
    v25 = v24;
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("blurRadiusT1")), "floatValue");
    v38[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v25, v26);
    v37[5] = CFSTR("inputMaxIntensity");
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxIntensityT0")), "floatValue");
    v28 = v27;
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxIntensityT1")), "floatValue");
    v38[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v28, v29);
    v37[6] = CFSTR("inputMinIntensity");
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minIntensityT0")), "floatValue");
    v31 = v30;
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minIntensityT1")), "floatValue");
    v38[6] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v31, v32);
    return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CISDOFHighlightRecovery"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 7));
  }
  return inputImage;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
