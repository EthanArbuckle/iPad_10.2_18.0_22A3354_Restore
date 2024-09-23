@implementation MIOHEVCAlphaStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 10;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MOVStreamEncoderConfig *v23;
  MOVStreamOutputSettings *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CMVideoDimensions Dimensions;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[4];
  _QWORD v42[6];

  v7 = a7;
  v8 = a6;
  v42[4] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v36 = (id)*MEMORY[0x24BDB22A8];
  objc_msgSend(v11, "objectForKey:", CFSTR("StreamEncoderType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13 == 10)
    +[MIOMastery masteryLossless](MIOMastery, "masteryLossless");
  else
    +[MIOMastery masteryFromConfig:formatDescription:frameRate:](MIOMastery, "masteryFromConfig:formatDescription:frameRate:", v11, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = *MEMORY[0x24BDF9348];
    v42[0] = MEMORY[0x24BDBD1C8];
    v16 = *MEMORY[0x24BDF9260];
    v41[0] = v15;
    v41[1] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = *MEMORY[0x24BDF92D0];
    v42[1] = v17;
    v42[2] = &unk_24CA5BD88;
    objc_msgSend(v14, "propertyKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v18;
    objc_msgSend(v14, "propertyValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    if (v7)
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:](MIOHEVCStreamOutputSettings, "applyHighPerfSettings:", v21);
    +[MIOHEVCStreamOutputSettings encoderSpecification](MIOHEVCStreamOutputSettings, "encoderSpecification");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:]([MOVStreamEncoderConfig alloc], "initWithCodecType:encoderSpecification:sessionProperties:", 1836415073, v22, v21);
    v24 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v23);

  }
  else
  {
    v39[0] = *MEMORY[0x24BDB22E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v25;
    v39[1] = *MEMORY[0x24BDB2318];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a5));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v26;
    objc_msgSend(v14, "propertyKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v27;
    objc_msgSend(v14, "propertyValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v29, "mutableCopy");

    if (v7)
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:](MIOHEVCStreamOutputSettings, "applyHighPerfSettings:", v21);
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    v31 = *MEMORY[0x24BDB2268];
    v38[0] = v36;
    v32 = *MEMORY[0x24BDB2368];
    v37[0] = v31;
    v37[1] = v32;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v33;
    v37[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = *MEMORY[0x24BDB22C8];
    v38[2] = v34;
    v38[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v22);
  }

  -[MOVStreamOutputSettings applyAdditionalCompressionPropertiesFromRecordingConfig:](v24, "applyAdditionalCompressionPropertiesFromRecordingConfig:", v11);
  return v24;
}

@end
