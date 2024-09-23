@implementation ADConfidenceLevelRanges

- (id)initForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6
{
  float end;
  float start;
  float v8;
  float v9;
  float v10;
  float v11;
  ADConfidenceLevelRanges *v13;
  ADConfidenceLevelRanges *v14;
  ADConfidenceLevelRanges *v15;
  __int16 v17[8];
  objc_super v18;

  end = a6.end;
  start = a6.start;
  v8 = a5.end;
  v9 = a5.start;
  v10 = a4.end;
  v11 = a4.start;
  v18.receiver = self;
  v18.super_class = (Class)ADConfidenceLevelRanges;
  v13 = -[ADConfidenceLevelRanges init](&v18, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  if (a3 != 1)
  {
    v13->_lowLevel.start = v11;
    v13->_lowLevel.end = v10;
    v13->_mediumLevel.start = v9;
    v13->_mediumLevel.end = v8;
    v13->_highLevel.start = start;
    v13->_highLevel.end = end;
    v13->_confidenceUnits = a3;
LABEL_7:
    v15 = v13;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v17[0] = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADConfidenceLevelRanges does not support levels confidence units", (uint8_t *)v17, 2u);
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (id)createConvertedRangesWithUnits:(unint64_t)a3 operation:(void *)a4
{
  ADConfidenceLevelRanges *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v7 = [ADConfidenceLevelRanges alloc];
  v8 = ((float (*)(uint64_t))a4)(-[ADConfidenceLevelRanges lowLevel](self, "lowLevel"));
  v9 = ((float (*)(uint64_t))a4)(-[ADConfidenceLevelRanges lowLevel](self, "lowLevel"));
  v10 = ((float (*)(uint64_t))a4)(-[ADConfidenceLevelRanges mediumLevel](self, "mediumLevel"));
  v11 = ((float (*)(uint64_t))a4)(-[ADConfidenceLevelRanges mediumLevel](self, "mediumLevel"));
  v12 = ((float (*)(uint64_t))a4)(-[ADConfidenceLevelRanges highLevel](self, "highLevel"));
  v13 = ((double (*)(uint64_t))a4)(-[ADConfidenceLevelRanges highLevel](self, "highLevel"));
  LODWORD(v14) = LODWORD(v13);
  *(float *)&v13 = v8;
  *(float *)&v15 = v9;
  *(float *)&v16 = v10;
  *(float *)&v17 = v11;
  *(float *)&v18 = v12;
  return -[ADConfidenceLevelRanges initForUnits:lowLevel:mediumLevel:highLevel:](v7, "initForUnits:lowLevel:mediumLevel:highLevel:", a3, v13, v15, v16, v17, v18, v14);
}

- (id)rangesForUnits:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t confidenceUnits;
  void *v10;
  float (*v11)(float);
  uint64_t v13;
  uint8_t v14[16];

  confidenceUnits = self->_confidenceUnits;
  if (confidenceUnits == a3)
  {
    *(float *)&v3 = self->_lowLevel.start;
    *(float *)&v4 = self->_lowLevel.end;
    *(float *)&v5 = self->_mediumLevel.start;
    *(float *)&v6 = self->_mediumLevel.end;
    *(float *)&v7 = self->_highLevel.start;
    *(float *)&v8 = self->_highLevel.end;
    +[ADConfidenceLevelRanges rangesForUnits:lowLevel:mediumLevel:highLevel:](ADConfidenceLevelRanges, "rangesForUnits:lowLevel:mediumLevel:highLevel:", v3, v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  switch(a3)
  {
    case 3uLL:
      if (confidenceUnits == 2)
      {
        v11 = postProcessingStandardDeviationToLogarithmicVariance;
      }
      else
      {
        if (confidenceUnits)
          break;
        v11 = postProcessingConfidenceToLogarithmicVariance;
      }
      v13 = 3;
      goto LABEL_24;
    case 2uLL:
      if (confidenceUnits == 3)
      {
        v11 = postProcessingLogarithmicVarianceToStd;
      }
      else
      {
        if (confidenceUnits)
          break;
        v11 = postProcessingConfidenceToStandardDeviation;
      }
      v13 = 2;
      goto LABEL_24;
    case 0uLL:
      if (confidenceUnits == 3)
      {
        v11 = postProcessingLogarithmicVarianceToConfidence;
        goto LABEL_19;
      }
      if (confidenceUnits == 2)
      {
        v11 = postProcessingStandardDeviationToConfidence;
LABEL_19:
        v13 = 0;
LABEL_24:
        -[ADConfidenceLevelRanges createConvertedRangesWithUnits:operation:](self, "createConvertedRangesWithUnits:operation:", v13, v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        return v10;
      }
      break;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed converting confidence levels range", v14, 2u);
  }
  return 0;
}

- (ADFloatRange)lowLevel
{
  float start;
  float end;
  ADFloatRange result;

  start = self->_lowLevel.start;
  end = self->_lowLevel.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setLowLevel:(ADFloatRange)a3
{
  self->_lowLevel = a3;
}

- (ADFloatRange)mediumLevel
{
  float start;
  float end;
  ADFloatRange result;

  start = self->_mediumLevel.start;
  end = self->_mediumLevel.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setMediumLevel:(ADFloatRange)a3
{
  self->_mediumLevel = a3;
}

- (ADFloatRange)highLevel
{
  float start;
  float end;
  ADFloatRange result;

  start = self->_highLevel.start;
  end = self->_highLevel.end;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setHighLevel:(ADFloatRange)a3
{
  self->_highLevel = a3;
}

- (unint64_t)confidenceUnits
{
  return self->_confidenceUnits;
}

+ (id)rangesForUnits:(unint64_t)a3 lowLevel:(ADFloatRange)a4 mediumLevel:(ADFloatRange)a5 highLevel:(ADFloatRange)a6
{
  float end;
  float start;
  float v8;
  float v9;
  float v10;
  float v11;
  ADConfidenceLevelRanges *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  end = a6.end;
  start = a6.start;
  v8 = a5.end;
  v9 = a5.start;
  v10 = a4.end;
  v11 = a4.start;
  v13 = [ADConfidenceLevelRanges alloc];
  *(float *)&v14 = v11;
  *(float *)&v15 = v10;
  *(float *)&v16 = v9;
  *(float *)&v17 = v8;
  *(float *)&v18 = start;
  *(float *)&v19 = end;
  return -[ADConfidenceLevelRanges initForUnits:lowLevel:mediumLevel:highLevel:](v13, "initForUnits:lowLevel:mediumLevel:highLevel:", a3, v14, v15, v16, v17, v18, v19);
}

@end
