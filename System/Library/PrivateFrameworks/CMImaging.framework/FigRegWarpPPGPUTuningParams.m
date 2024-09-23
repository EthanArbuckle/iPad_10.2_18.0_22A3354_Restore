@implementation FigRegWarpPPGPUTuningParams

- (int)readPlist:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  int v15;
  int v16;
  double v17;
  void *v18;
  NSArray *v19;
  NSArray *minCornerResponseThreshold;
  int v21;
  char v23;

  v23 = 0;
  v4 = (id)MEMORY[0x1E0C9AA70];
  if (a3)
    v4 = a3;
  v5 = v4;
  self->_maxNumberOfPyramidLevels = objc_msgSend(v5, "cmi_unsignedIntValueForKey:defaultValue:found:", CFSTR("MaxNumberOfPyramidLevels"), 4, &v23);
  if (!v23)
    FigSignalErrorAt();
  self->_normalizeCornerResponse = objc_msgSend(v5, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("NormalizeCornerResponse"), 0, &v23);
  if (!v23)
    FigSignalErrorAt();
  self->_performHistEq = objc_msgSend(v5, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("PerformHistEq"), 1, &v23);
  if (!v23)
    FigSignalErrorAt();
  self->_useHalfPrecisionCornerResponse = objc_msgSend(v5, "cmi_BOOLValueForKey:defaultValue:found:", CFSTR("UseHalfPrecisionCornerResponse"), 0, &v23);
  if (!v23)
    FigSignalErrorAt();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Bands"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Bands")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Bands"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == self->_maxNumberOfPyramidLevels)
    {
      v11 = (void *)objc_opt_new();
      if (self->_maxNumberOfPyramidLevels)
      {
        v12 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = 1008981770;
          objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", CFSTR("MinCornerResponseThreshold"), &v23, v14);
          v16 = v15;

          if (!v23)
            FigSignalErrorAt();
          LODWORD(v17) = v16;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

          ++v12;
        }
        while (v12 < self->_maxNumberOfPyramidLevels);
      }
      v19 = (NSArray *)objc_msgSend(v11, "copy");
      minCornerResponseThreshold = self->_minCornerResponseThreshold;
      self->_minCornerResponseThreshold = v19;

      v21 = 0;
    }
    else
    {
      FigDebugAssert3();
      v21 = FigSignalErrorAt();
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int)getMinCornerResponseThreshold:(float *)a3 forBand:(unsigned int)a4
{
  NSArray *minCornerResponseThreshold;
  void *v8;
  float v9;
  float v10;

  if (a3)
  {
    minCornerResponseThreshold = self->_minCornerResponseThreshold;
    if (!minCornerResponseThreshold)
    {
      v10 = 1.0;
      goto LABEL_6;
    }
    if (-[NSArray count](minCornerResponseThreshold, "count") > a4)
    {
      -[NSArray objectAtIndexedSubscript:](self->_minCornerResponseThreshold, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

LABEL_6:
      *a3 = v10;
      return 0;
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (unsigned)maxNumberOfPyramidLevels
{
  return self->_maxNumberOfPyramidLevels;
}

- (BOOL)normalizeCornerResponse
{
  return self->_normalizeCornerResponse;
}

- (BOOL)performHistEq
{
  return self->_performHistEq;
}

- (BOOL)useHalfPrecisionCornerResponse
{
  return self->_useHalfPrecisionCornerResponse;
}

- (NSArray)minCornerResponseThreshold
{
  return self->_minCornerResponseThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minCornerResponseThreshold, 0);
}

@end
