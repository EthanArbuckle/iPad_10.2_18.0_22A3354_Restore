@implementation MOVStreamPreProcessorFactory

+ (id)defaultFactory
{
  if (+[MOVStreamPreProcessorFactory defaultFactory]::onceToken != -1)
    dispatch_once(&+[MOVStreamPreProcessorFactory defaultFactory]::onceToken, &__block_literal_global_5);
  return (id)+[MOVStreamPreProcessorFactory defaultFactory]::factory;
}

void __46__MOVStreamPreProcessorFactory_defaultFactory__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[MOVStreamPreProcessorFactory defaultFactory]::factory;
  +[MOVStreamPreProcessorFactory defaultFactory]::factory = v0;

}

- (id)preProcessorForFormat:(opaqueCMFormatDescription *)a3 recordingConfiguration:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t MediaSubType;
  uint64_t v9;
  BOOL v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("StreamEncoderType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  v9 = MediaSubType;
  v10 = (v7 & 0xFFFFFFFE) != 6 || (_DWORD)MediaSubType == 1278226488;
  if (v10
    || (objc_msgSend(v5, "objectForKey:", CFSTR("StreamConvertNonPlanarBuffersTo8bitMonochrome")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        (v12 & 1) == 0))
  {
    if (+[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", v9))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("RawBayerRearrangeTypeKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "intValue");

    }
    else
    {
      +[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:](MIOPixelBufferUtility, "isPixelFormatCompandedRawBayer:", v9);
    }
  }
  v14 = (void *)objc_opt_new();

  return v14;
}

@end
