@implementation MIOH264StreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 8;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  void *v11;
  void *v12;

  v7 = a7;
  v8 = a6;
  +[MIOMastery masteryFromConfig:formatDescription:frameRate:](MIOMastery, "masteryFromConfig:formatDescription:frameRate:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "outputSettingsMastery:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:", v11, a4, v8, v7, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)outputSettingsMastery:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MOVStreamEncoderConfig *v19;
  void *v20;
  MOVStreamEncoderConfig *v21;
  MOVStreamOutputSettings *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CMVideoDimensions Dimensions;
  uint64_t v29;
  void *v30;
  void *v31;
  MOVStreamOutputSettings *v32;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];
  _QWORD v39[6];

  v7 = a7;
  v8 = a6;
  v39[4] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (v8)
  {
    v12 = *MEMORY[0x24BDF9348];
    v39[0] = MEMORY[0x24BDBD1C8];
    v13 = *MEMORY[0x24BDF9260];
    v38[0] = v12;
    v38[1] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = *MEMORY[0x24BDF92D0];
    v39[1] = v14;
    v39[2] = &unk_24CA5BDD8;
    objc_msgSend(v11, "propertyKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v15;
    objc_msgSend(v11, "propertyValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if (v7)
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:](MIOHEVCStreamOutputSettings, "applyHighPerfSettings:", v18);
    v19 = [MOVStreamEncoderConfig alloc];
    +[MIOHEVCStreamOutputSettings encoderSpecification](MIOHEVCStreamOutputSettings, "encoderSpecification");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v19, "initWithCodecType:encoderSpecification:sessionProperties:", 1635148593, v20, v18);

    v22 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v21);
  }
  else
  {
    v36[0] = *MEMORY[0x24BDB22E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v23;
    v36[1] = *MEMORY[0x24BDB2318];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a5));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v24;
    objc_msgSend(v11, "propertyKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v25;
    objc_msgSend(v11, "propertyValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v27, "mutableCopy");

    if (v7)
      +[MIOHEVCStreamOutputSettings applyHighPerfSettings:](MIOHEVCStreamOutputSettings, "applyHighPerfSettings:", v18);
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    v29 = *MEMORY[0x24BDB2268];
    v35[0] = *MEMORY[0x24BDB2298];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions, v29, *MEMORY[0x24BDB2368]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v30;
    v34[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = *MEMORY[0x24BDB22C8];
    v35[2] = v31;
    v35[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v21 = (MOVStreamEncoderConfig *)objc_claimAutoreleasedReturnValue();

    v22 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v21);
  }
  v32 = v22;

  return v32;
}

@end
