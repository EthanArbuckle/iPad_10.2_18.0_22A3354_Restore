@implementation MIOMiscStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 < 0x21) & (0x100070000uLL >> a3);
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL8 v7;
  id v9;
  void *v10;
  int v11;
  MOVStreamOutputSettings *v12;
  void *v13;
  uint64_t v14;
  id v16;

  v7 = a7;
  v9 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("StreamEncoderType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (v11 > 17)
  {
    if (v11 != 18)
    {
      if (v11 == 32)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("CustomOutputSettings"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v13);
        -[MOVStreamOutputSettings applyAdditionalCompressionPropertiesFromRecordingConfig:](v12, "applyAdditionalCompressionPropertiesFromRecordingConfig:", v9);

        goto LABEL_11;
      }
LABEL_12:
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid encoder type."), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    objc_msgSend((id)objc_opt_class(), "customEncoderSettingsFromConfig:frameRate:enableAVEHighPerformanceProfile:", v9, v7, a5);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = (MOVStreamOutputSettings *)v14;
    goto LABEL_11;
  }
  if (v11 == 16)
  {
    objc_msgSend((id)objc_opt_class(), "audioSettingsFromConfig:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v11 != 17)
    goto LABEL_12;
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)customEncoderSettingsFromConfig:(id)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  void *v6;
  MOVStreamOutputSettings *v7;
  MOVStreamOutputSettings *v8;

  objc_msgSend(a3, "objectForKey:", CFSTR("CustomEncoderConfig"), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v6);
  else
    v7 = -[MOVStreamOutputSettings initWithFrameRate:useCustomEncoderConfig:]([MOVStreamOutputSettings alloc], "initWithFrameRate:useCustomEncoderConfig:", 1, a4);
  v8 = v7;

  return v8;
}

+ (id)audioSettingsFromConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MOVStreamOutputSettings *v9;
  void *v10;
  MOVStreamOutputSettings *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKey:", CFSTR("AudioFormatObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("AdditionalAudioSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v4, "addEntriesFromDictionary:", v8);
  if (objc_msgSend(v4, "count"))
  {
    v9 = [MOVStreamOutputSettings alloc];
    v10 = (void *)objc_msgSend(v4, "copy");
    v11 = -[MOVStreamOutputSettings initWithSettings:](v9, "initWithSettings:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
