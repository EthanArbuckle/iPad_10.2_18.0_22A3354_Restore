@implementation MIOYzipStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 31;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  MOVStreamEncoderConfig *v10;
  MOVStreamEncoderConfig *v11;
  MOVStreamOutputSettings *v12;
  CMVideoDimensions Dimensions;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v7 = a6;
  v21[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (v7)
  {
    v10 = [MOVStreamEncoderConfig alloc];
    v11 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v10, "initWithCodecType:encoderSpecification:sessionProperties:", 2038065520, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8]);
    v12 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v11);

  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    v14 = *MEMORY[0x24BDB2268];
    v21[0] = CFSTR("yzip");
    v15 = *MEMORY[0x24BDB2368];
    v20[0] = v14;
    v20[1] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v16;
    v20[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v18);
  }

  return v12;
}

@end
