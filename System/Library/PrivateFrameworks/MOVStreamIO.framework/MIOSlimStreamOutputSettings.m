@implementation MIOSlimStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return a3 == 1;
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  CMVideoDimensions Dimensions;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MOVStreamOutputSettings *v23;
  MOVStreamEncoderConfig *v24;
  MOVStreamEncoderConfig *v25;
  const __CFString *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  const __CFString *v31;
  _QWORD v32[2];

  v7 = a6;
  v32[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("UseSlimXCompression"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      v31 = CFSTR("InternalCodecType");
      v32[0] = &unk_24CA5BC10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDBD1B8];
    }
    v24 = [MOVStreamEncoderConfig alloc];
    v25 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v24, "initWithCodecType:encoderSpecification:sessionProperties:", 1936484717, MEMORY[0x24BDBD1B8], v13);
    v23 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v25);

  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    v15 = *MEMORY[0x24BDB2268];
    v30[0] = CFSTR("slim");
    v16 = *MEMORY[0x24BDB2368];
    v29[0] = v15;
    v29[1] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v17;
    v29[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("UseSlimXCompression"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v19, "BOOLValue");

    if ((_DWORD)v18)
    {
      v20 = (void *)objc_msgSend(v13, "mutableCopy");
      v27 = CFSTR("InternalCodecType");
      v28 = &unk_24CA5BC10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x24BDB22C8]);
      v22 = objc_msgSend(v20, "copy");

      v13 = (void *)v22;
    }
    v23 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v13);
  }

  return v23;
}

@end
