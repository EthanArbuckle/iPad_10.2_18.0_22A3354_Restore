@implementation MIOJPEGStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 33;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MOVStreamEncoderConfig *v19;
  MOVStreamOutputSettings *v20;
  CMVideoDimensions Dimensions;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v7 = a6;
  v37[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("EncodingQuality"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
    v13 = v12;
    if (v7)
    {
LABEL_3:
      v36 = *MEMORY[0x24BDF99B8];
      v14 = MEMORY[0x24BDBD1C8];
      v37[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *MEMORY[0x24BDF9348];
      v35 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      if (v13 >= 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, *MEMORY[0x24BDF9338]);

      }
      v19 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:]([MOVStreamEncoderConfig alloc], "initWithCodecType:encoderSpecification:sessionProperties:", 1785750887, v15, v17);
      v20 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v19);

      goto LABEL_10;
    }
  }
  else
  {
    v13 = -1.0;
    if (v7)
      goto LABEL_3;
  }
  Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
  v22 = *MEMORY[0x24BDB2268];
  v33[0] = *MEMORY[0x24BDB22B0];
  v23 = *MEMORY[0x24BDB2368];
  v32[0] = v22;
  v32[1] = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v24;
  v32[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v26, "mutableCopy");

  if (v13 >= 0.0)
  {
    v30 = *MEMORY[0x24BDB2350];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v28, *MEMORY[0x24BDB22C8]);
  }
  v20 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v15);
LABEL_10:

  return v20;
}

@end
