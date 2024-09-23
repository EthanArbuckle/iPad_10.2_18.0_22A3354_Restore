@implementation MIOHEVCStreamOutputSettings

+ (id)AVEEncoderTypeRequiresCustomEncodingLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::onceToken != -1)
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::onceToken, &__block_literal_global_0);
  return (id)+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp;
}

void __73__MIOHEVCStreamOutputSettings_AVEEncoderTypeRequiresCustomEncodingLookUp__block_invoke()
{
  void *v0;

  v0 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp]::lookUp = MEMORY[0x24BDBD1B8];

}

+ (id)AVEEncoderTypeLosslessMasteringLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::onceToken != -1)
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::onceToken, &__block_literal_global_126);
  return (id)+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp;
}

void __68__MIOHEVCStreamOutputSettings_AVEEncoderTypeLosslessMasteringLookUp__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CA5B550;
  v2[1] = &unk_24CA5B568;
  v3[0] = MEMORY[0x24BDBD1C8];
  v3[1] = MEMORY[0x24BDBD1C8];
  v2[2] = &unk_24CA5B580;
  v2[3] = &unk_24CA5B598;
  v3[2] = MEMORY[0x24BDBD1C8];
  v3[3] = MEMORY[0x24BDBD1C8];
  v2[4] = &unk_24CA5B5B0;
  v2[5] = &unk_24CA5B5C8;
  v3[4] = MEMORY[0x24BDBD1C8];
  v3[5] = MEMORY[0x24BDBD1C8];
  v2[6] = &unk_24CA5B5E0;
  v2[7] = &unk_24CA5B5F8;
  v3[6] = MEMORY[0x24BDBD1C8];
  v3[7] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp]::lookUp = v0;

}

+ (id)AVEEncoderTypeProfileLevelLookUp
{
  if (+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::onceToken != -1)
    dispatch_once(&+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::onceToken, &__block_literal_global_135);
  return (id)+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp;
}

void __63__MIOHEVCStreamOutputSettings_AVEEncoderTypeProfileLevelLookUp__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CA5B550;
  v2[1] = &unk_24CA5B610;
  v3[0] = CFSTR("HEVC_Monochrome10_AutoLevel");
  v3[1] = CFSTR("HEVC_Monochrome10_AutoLevel");
  v2[2] = &unk_24CA5B568;
  v2[3] = &unk_24CA5B628;
  v3[2] = CFSTR("HEVC_Monochrome_AutoLevel");
  v3[3] = CFSTR("HEVC_Monochrome_AutoLevel");
  v2[4] = &unk_24CA5B580;
  v2[5] = &unk_24CA5B640;
  v3[4] = CFSTR("HEVC_Main_AutoLevel");
  v3[5] = CFSTR("HEVC_Main_AutoLevel");
  v2[6] = &unk_24CA5B598;
  v2[7] = &unk_24CA5B658;
  v3[6] = CFSTR("HEVC_Main444_AutoLevel");
  v3[7] = CFSTR("HEVC_Main444_AutoLevel");
  v2[8] = &unk_24CA5B5B0;
  v2[9] = &unk_24CA5B670;
  v3[8] = CFSTR("HEVC_Main10_AutoLevel");
  v3[9] = CFSTR("HEVC_Main10_AutoLevel");
  v2[10] = &unk_24CA5B5C8;
  v2[11] = &unk_24CA5B688;
  v3[10] = CFSTR("HEVC_Main44410_AutoLevel");
  v3[11] = CFSTR("HEVC_Main44410_AutoLevel");
  v2[12] = &unk_24CA5B5E0;
  v2[13] = &unk_24CA5B6A0;
  v3[12] = CFSTR("HEVC_Main42210_AutoLevel");
  v3[13] = CFSTR("HEVC_Main42210_AutoLevel");
  v2[14] = &unk_24CA5B5F8;
  v2[15] = &unk_24CA5B6B8;
  v3[14] = CFSTR("HEVC_Main42210_AutoLevel");
  v3[15] = CFSTR("HEVC_Main42210_AutoLevel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp]::lookUp = v0;

}

+ (id)outputBitDepthIfRequiredForEncoderType:(int)a3
{
  if ((a3 & 0xFFFFFFFE) == 0x22)
    return &unk_24CA5B6D0;
  else
    return 0;
}

+ (BOOL)supportsEncoderType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = *(_QWORD *)&a3;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp](MIOHEVCStreamOutputSettings, "AVEEncoderTypeProfileLevelLookUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  uint64_t v7;
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  CMVideoDimensions Dimensions;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  v7 = a7;
  v8 = a6;
  v22 = a3;
  objc_msgSend(v22, "objectForKey:", CFSTR("StreamEncoderType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeLosslessMasteringLookUp](MIOHEVCStreamOutputSettings, "AVEEncoderTypeLosslessMasteringLookUp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v18, "BOOLValue");

  if ((_DWORD)v7)
    +[MIOMastery masteryLossless](MIOMastery, "masteryLossless");
  else
    +[MIOMastery masteryFromConfig:formatDescription:frameRate:](MIOMastery, "masteryFromConfig:formatDescription:frameRate:", v22, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "outputSettings:frameRate:dimensions:mastery:preferEncoderConfig:enableAVEHighPerformanceProfile:", v12, Dimensions, v19, v15, v16, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applyAdditionalCompressionPropertiesFromRecordingConfig:", v22);

  return v20;
}

+ (id)outputSettings:(int)a3 frameRate:(double)a4 dimensions:(id)a5 mastery:(id)a6 preferEncoderConfig:(BOOL)a7 enableAVEHighPerformanceProfile:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  id v23;
  id v24;

  v8 = a8;
  v11 = *(_QWORD *)&a3;
  v12 = a6;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeProfileLevelLookUp](MIOHEVCStreamOutputSettings, "AVEEncoderTypeProfileLevelLookUp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD1118], CFSTR("HEVC config not available."), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  if (a7)
    goto LABEL_4;
  +[MIOHEVCStreamOutputSettings AVEEncoderTypeRequiresCustomEncodingLookUp](MIOHEVCStreamOutputSettings, "AVEEncoderTypeRequiresCustomEncodingLookUp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) != 0)
  {
LABEL_4:
    objc_msgSend((id)objc_opt_class(), "hevcSettingsWithProfileLevel:encoderType:frameRate:mastery:enableAVEHighPerformanceProfile:", v15, v11, v12, v8, a4);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "hevcAVFSettingsWithProfileLevel:encoderType:frameRate:dimensions:mastery:enableAVEHighPerformanceProfile:", v15, v11, a5, v12, v8, a4);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD1118], CFSTR("HEVC config not available."), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  return v21;
}

+ (id)hevcAVFSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 dimensions:(id)a6 mastery:(id)a7 enableAVEHighPerformanceProfile:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  MOVStreamOutputSettings *v28;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[6];

  v8 = a8;
  v12 = *(_QWORD *)&a4;
  v34[4] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  v15 = *MEMORY[0x24BDF9330];
  v30 = v14;
  v34[0] = v13;
  v16 = *MEMORY[0x24BDF9260];
  v33[0] = v15;
  v33[1] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = *MEMORY[0x24BDF92D0];
  v34[1] = v17;
  v34[2] = &unk_24CA5BD78;
  objc_msgSend(v14, "propertyKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v18;
  objc_msgSend(v14, "propertyValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "outputBitDepthIfRequiredForEncoderType:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("OutputBitDepth"));
  objc_msgSend((id)objc_opt_class(), "adjustAVFCompressionProperties:encoderType:", v21, v12);
  if (v8)
    objc_msgSend((id)objc_opt_class(), "applyHighPerfSettings:", v21);
  v23 = *MEMORY[0x24BDB2268];
  v32[0] = *MEMORY[0x24BDB22A0];
  v24 = *MEMORY[0x24BDB2368];
  v31[0] = v23;
  v31[1] = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v25;
  v31[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&a6));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = *MEMORY[0x24BDB22C8];
  v32[2] = v26;
  v32[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v27);
  return v28;
}

+ (id)hevcSettingsWithProfileLevel:(id)a3 encoderType:(int)a4 frameRate:(double)a5 mastery:(id)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MOVStreamEncoderConfig *v20;
  void *v21;
  MOVStreamEncoderConfig *v22;
  MOVStreamOutputSettings *v23;
  _QWORD v25[5];
  _QWORD v26[6];

  v7 = a7;
  v10 = *(_QWORD *)&a4;
  v26[5] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = *MEMORY[0x24BDF9348];
  v25[0] = *MEMORY[0x24BDF9330];
  v25[1] = v13;
  v26[0] = v11;
  v26[1] = MEMORY[0x24BDBD1C8];
  v25[2] = *MEMORY[0x24BDF9260];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = *MEMORY[0x24BDF92D0];
  v26[2] = v14;
  v26[3] = &unk_24CA5BD78;
  objc_msgSend(v12, "propertyKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v15;
  objc_msgSend(v12, "propertyValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "outputBitDepthIfRequiredForEncoderType:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("OutputBitDepth"));
  if (v7)
    objc_msgSend((id)objc_opt_class(), "applyHighPerfSettings:", v18);
  v20 = [MOVStreamEncoderConfig alloc];
  objc_msgSend((id)objc_opt_class(), "encoderSpecification");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v20, "initWithCodecType:encoderSpecification:sessionProperties:", 1752589105, v21, v18);

  v23 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v22);
  return v23;
}

+ (id)encoderSpecification
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF99C0];
  v4[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)applyHighPerfSettings:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);

}

+ (id)masteryFromStreamData:(StreamRecordingData *)a3 withFrameRate:(double)a4
{
  unint64_t v5;
  double v6;

  v5 = +[MOVStreamOutputSettings getBitsPerSecondForColorStream:frameRate:](MOVStreamOutputSettings, "getBitsPerSecondForColorStream:frameRate:", a4);
  +[MOVStreamOutputSettings getQualitySetting:](MOVStreamOutputSettings, "getQualitySetting:", a3);
  if (v6 >= 0.0)
    +[MIOMastery masteryWithQuality:](MIOMastery, "masteryWithQuality:");
  else
    +[MIOMastery masteryWithBitrate:](MIOMastery, "masteryWithBitrate:", (double)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)avfEncoderSpecForEncoderType:(int)a3
{
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_opt_class(), "requiresSWEncoder:", *(_QWORD *)&a3))
  {
    v5 = *MEMORY[0x24BDF99B8];
    v6[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v3;
}

+ (BOOL)requiresSWEncoder:(int)a3
{
  return 0;
}

@end
