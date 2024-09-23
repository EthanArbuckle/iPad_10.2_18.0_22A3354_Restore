@implementation Matcher

- (Matcher)initWithAnimationName:(id)a3
{
  id v4;
  char *v5;
  Matcher *v6;
  unint64_t v7;
  unsigned int v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Matcher;
  v5 = -[Matcher init](&v10, "init");
  v6 = (Matcher *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 28) = 0x23F4CCCCDLL;
    *((_DWORD *)v5 + 10) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_QWORD *)v5 + 9) = 0;
    objc_msgSend(v5, "reset");
    -[Matcher loadTemplate:](v6, "loadTemplate:", v4);
    LODWORD(v7) = v6->_kernelLength;
    v8 = ((double)v7 * 0.5);
    v6->_correlationLength = v8;
    v6->_correlation = (float *)malloc_type_realloc(v6->_correlation, 4 * v8, 0x100004052888210uLL);
    v6->_matchError = (float *)malloc_type_realloc(v6->_matchError, 4 * v6->_correlationLength, 0x100004052888210uLL);
  }

  return v6;
}

- (void)reset
{
  self->_matched = 0;
  *(_QWORD *)&self->_matchStrength = 0;
}

- (void)dealloc
{
  float *correlation;
  float *kernel;
  float *normalizedSignal;
  float *matchError;
  objc_super v7;

  correlation = self->_correlation;
  if (correlation)
    free(correlation);
  kernel = self->_kernel;
  if (kernel)
    free(kernel);
  normalizedSignal = self->_normalizedSignal;
  if (normalizedSignal)
    free(normalizedSignal);
  matchError = self->_matchError;
  if (matchError)
    free(matchError);
  v7.receiver = self;
  v7.super_class = (Class)Matcher;
  -[Matcher dealloc](&v7, "dealloc");
}

- (void)loadTemplate:(id)a3
{
  id v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  FILE *v10;
  FILE *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  float *v15;
  void *v16;
  uint64_t v17;
  uint64_t __StandardDeviation;
  uint64_t __ptr;

  v5 = a3;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(Matcher));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathForResource:ofType:", v5, CFSTR("dat")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LOBYTE(v5) = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v5 & 1) != 0
    && (v10 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), "rb")) != 0)
  {
    v11 = v10;
    __ptr = 0;
    fread((char *)&__ptr + 4, 4uLL, 1uLL, v10);
    fread(&__ptr, 4uLL, 1uLL, v11);
    v12 = HIDWORD(__ptr);
    v13 = SHIDWORD(__ptr);
    v14 = (char *)&v17 - ((4 * HIDWORD(__ptr) + 15) & 0x7FFFFFFF0);
    if (fread(v14, __ptr, HIDWORD(__ptr), v11) != v12)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Matcher.m"), 87, CFSTR("Error reading file. Number of elements not as expected."));

    }
    fclose(v11);
    self->_kernelLength = 2 * v13;
    v15 = (float *)malloc_type_realloc(self->_kernel, 4 * (2 * v13), 0x100004052888210uLL);
    self->_kernel = v15;
    memcpy(v15, v14, 4 * v13);
    memcpy(&self->_kernel[v13], v14, 4 * v13);
    __StandardDeviation = 0;
    vDSP_normalize(self->_kernel, 1, self->_kernel, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, self->_kernelLength);
    self->_normalizedSignal = (float *)malloc_type_realloc(self->_normalizedSignal, 4 * self->_kernelLength, 0x100004052888210uLL);
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSFileHandleOperationException, CFSTR("Template file not found."));
  }

}

- (BOOL)match:(float *)a3 withLength:(unsigned int)a4
{
  uint64_t v4;
  int v6;
  BOOL result;
  float __C;
  vDSP_Length __I;

  v4 = *(_QWORD *)&a4;
  -[Matcher computeNormalizedSignal:withLength:](self, "computeNormalizedSignal:withLength:", a3);
  __I = 0;
  __C = 0.0;
  vDSP_maxvi(self->_normalizedSignal, 1, &__C, &__I, v4);
  -[Matcher circularCorrelation:withLength:](self, "circularCorrelation:withLength:", self->_normalizedSignal, v4);
  if (self->_matchStrength < self->_strengthThreshold)
    goto LABEL_5;
  v6 = self->_matchIndex - __I;
  if (v6 < 0)
    v6 = __I - self->_matchIndex;
  if ((signed int)(v6 % (self->_kernelLength >> 1)) <= (signed int)self->_sampleThreshold)
    result = 1;
  else
LABEL_5:
    result = 0;
  self->_matched = result;
  return result;
}

- (void)computeNormalizedSignal:(float *)a3 withLength:(unsigned int)a4
{
  vDSP_Length v6;
  uint64_t __StandardDeviation;

  v6 = a4;
  if (self->_kernelLength < a4)
    self->_normalizedSignal = (float *)malloc_type_realloc(self->_normalizedSignal, 4 * a4, 0x100004052888210uLL);
  __StandardDeviation = 0;
  vDSP_normalize(a3, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v6);
  *((float *)&__StandardDeviation + 1) = -*((float *)&__StandardDeviation + 1);
  vDSP_vsadd(a3, 1, (const float *)&__StandardDeviation + 1, self->_normalizedSignal, 1, v6);
  if (*(float *)&__StandardDeviation < self->_std_floor)
    *(float *)&__StandardDeviation = self->_std_floor;
  vDSP_vsdiv(self->_normalizedSignal, 1, (const float *)&__StandardDeviation, self->_normalizedSignal, 1, v6);
}

- (void)circularCorrelation:(float *)a3 withLength:(unsigned int)a4
{
  unint64_t v4;
  double v7;
  uint64_t v8;
  unint64_t v9;
  vDSP_Length signalCorrLength;
  int v11;
  uint64_t signalOffset;
  float __C;
  vDSP_Length __I;

  self->_signalOffset = 0;
  self->_signalCorrLength = a4;
  LODWORD(v4) = self->_kernelLength;
  v7 = (double)v4 * 0.5;
  if (v7 >= (double)a4)
  {
    v8 = 0;
  }
  else
  {
    v8 = a4 - v7;
    self->_signalOffset = v8;
    self->_signalCorrLength = v7;
    a4 = v7;
  }
  vDSP_conv(self->_kernel, 1, &a3[v8], 1, self->_correlation, 1, self->_correlationLength, a4);
  __I = 0;
  vDSP_maxvi(self->_correlation, 1, &self->_matchStrength, &__I, self->_correlationLength);
  signalCorrLength = self->_signalCorrLength;
  self->_matchStrength = self->_matchStrength / (float)signalCorrLength;
  v11 = __I;
  if (__I)
    v11 = self->_correlationLength - __I;
  signalOffset = self->_signalOffset;
  LODWORD(v9) = self->_kernelLength;
  self->_matchIndex = v11 + signalOffset;
  vDSP_vsub(&self->_kernel[((double)v9 * 0.5) - v11], 1, &a3[signalOffset], 1, self->_matchError, 1, signalCorrLength);
  vDSP_vabs(self->_matchError, 1, self->_matchError, 1, signalCorrLength);
  __C = 0.0;
  vDSP_maxv(self->_matchError, 1, &__C, signalCorrLength);
  self->_matchStrength = 1.0 - __C;
}

- (float)strengthThreshold
{
  return self->_strengthThreshold;
}

- (void)setStrengthThreshold:(float)a3
{
  self->_strengthThreshold = a3;
}

- (unsigned)sampleThreshold
{
  return self->_sampleThreshold;
}

- (void)setSampleThreshold:(unsigned int)a3
{
  self->_sampleThreshold = a3;
}

- (float)std_floor
{
  return self->_std_floor;
}

- (void)setStd_floor:(float)a3
{
  self->_std_floor = a3;
}

- (BOOL)matched
{
  return self->_matched;
}

- (float)normalizedSignal
{
  return self->_normalizedSignal;
}

- (float)kernel
{
  return self->_kernel;
}

- (unsigned)kernelLength
{
  return self->_kernelLength;
}

- (float)correlation
{
  return self->_correlation;
}

- (unsigned)correlationLength
{
  return self->_correlationLength;
}

- (float)matchStrength
{
  return self->_matchStrength;
}

- (unsigned)matchIndex
{
  return self->_matchIndex;
}

- (unsigned)signalOffset
{
  return self->_signalOffset;
}

- (unsigned)signalCorrLength
{
  return self->_signalCorrLength;
}

@end
