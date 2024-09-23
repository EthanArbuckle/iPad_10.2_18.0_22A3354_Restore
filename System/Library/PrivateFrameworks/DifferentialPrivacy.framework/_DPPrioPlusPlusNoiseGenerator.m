@implementation _DPPrioPlusPlusNoiseGenerator

+ (id)randomize:(id)a3 dimension:(unint64_t)a4 stddev:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  float *v10;
  float *i;
  float v12;
  id v13;
  NSObject *v14;

  v7 = a3;
  +[_DPGaussianPRNG generateSeed](_DPGaussianPRNG, "generateSeed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPGaussianPRNG randomFloatVectorFromSeed:length:mean:stddev:](_DPGaussianPRNG, "randomFloatVectorFromSeed:length:mean:stddev:", v8, a4, 0.0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (float *)objc_msgSend(objc_retainAutorelease(v7), "mutableBytes");
    for (i = (float *)objc_msgSend(objc_retainAutorelease(v9), "bytes"); a4; --a4)
    {
      v12 = *i++;
      *v10 = *v10 - v12;
      ++v10;
    }
    v13 = v8;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:].cold.1(v14);

    v13 = 0;
  }

  return v13;
}

+ (BOOL)isValidSigma:(double)a3
{
  return a3 > 0.0;
}

+ (BOOL)isValidDimension:(unint64_t)a3
{
  return a3 - 1 < 0x39FBC;
}

+ (void)randomize:(os_log_t)log dimension:stddev:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusNoiseGenerator failed to generate random numbers from a seed.", v1, 2u);
}

@end
