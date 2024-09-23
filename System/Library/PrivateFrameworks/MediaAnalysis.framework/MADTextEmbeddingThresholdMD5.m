@implementation MADTextEmbeddingThresholdMD5

+ (id)modelName
{
  return CFSTR("text_threshold_md5.espresso.net");
}

+ (unint64_t)embeddingVersion
{
  return 5;
}

+ (unint64_t)embeddingLength
{
  return 512;
}

+ (float)thresholdBase
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MADTextEmbeddingThresholdMD5_thresholdBase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MADTextEmbeddingThresholdMD5 thresholdBase]::once != -1)
    dispatch_once(&+[MADTextEmbeddingThresholdMD5 thresholdBase]::once, block);
  return *(float *)&+[MADTextEmbeddingThresholdMD5 thresholdBase]::thresholdBase;
}

uint64_t __45__MADTextEmbeddingThresholdMD5_thresholdBase__block_invoke()
{
  void *v0;
  double v1;
  uint64_t result;
  int v3;

  v0 = (void *)objc_opt_class();
  LODWORD(v1) = 1053273620;
  result = objc_msgSend(v0, "computeThresholdBase:", v1);
  +[MADTextEmbeddingThresholdMD5 thresholdBase]::thresholdBase = v3;
  return result;
}

@end
