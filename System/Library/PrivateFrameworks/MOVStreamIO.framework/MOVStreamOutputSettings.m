@implementation MOVStreamOutputSettings

- (MOVStreamOutputSettings)init
{
  MOVStreamOutputSettings *v2;
  MOVStreamOutputSettings *v3;
  NSDictionary *settings;
  MOVStreamEncoderConfig *config;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOVStreamOutputSettings;
  v2 = -[MOVStreamOutputSettings init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    settings = v2->_settings;
    v2->_settings = 0;

    config = v3->_config;
    v3->_config = 0;

    v3->_useCustomEncoderConfig = 0;
    v3->_expectedFrameRate = 0.0;
  }
  return v3;
}

- (MOVStreamOutputSettings)initWithSettings:(id)a3
{
  id v5;
  MOVStreamOutputSettings *v6;
  MOVStreamOutputSettings *v7;

  v5 = a3;
  v6 = -[MOVStreamOutputSettings init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (MOVStreamOutputSettings)initWithConfig:(id)a3
{
  id v5;
  MOVStreamOutputSettings *v6;
  MOVStreamOutputSettings *v7;

  v5 = a3;
  v6 = -[MOVStreamOutputSettings init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v7->_useCustomEncoderConfig = 1;
  }

  return v7;
}

- (MOVStreamOutputSettings)initWithFrameRate:(double)a3
{
  MOVStreamOutputSettings *result;

  result = -[MOVStreamOutputSettings init](self, "init");
  if (result)
    result->_expectedFrameRate = a3;
  return result;
}

- (MOVStreamOutputSettings)initWithFrameRate:(double)a3 useCustomEncoderConfig:(BOOL)a4
{
  MOVStreamOutputSettings *result;

  result = -[MOVStreamOutputSettings init](self, "init");
  if (result)
  {
    result->_useCustomEncoderConfig = a4;
    result->_expectedFrameRate = a3;
  }
  return result;
}

+ (BOOL)supportsEncoderType:(int)a3
{
  return 1;
}

+ (int)encoderTypeFromStreamData:(StreamRecordingData *)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;

  v3 = a3->var5;
  v4 = v3;
  if (!v3)
    __assert_rtn("+[MOVStreamOutputSettings encoderTypeFromStreamData:]", "MOVStreamOutputSettings.mm", 106, "configuration");
  objc_msgSend(v3, "objectForKey:", CFSTR("StreamEncoderType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v7 = objc_msgSend((id)objc_opt_class(), "matchDeprecatedType:", v6);
  return v7;
}

+ (id)outputSettingsForStream:(StreamRecordingData *)a3 defaultFrameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v18;

  v5 = a5;
  v8 = a3->var5;
  if (!v8)
    __assert_rtn("+[MOVStreamOutputSettings outputSettingsForStream:defaultFrameRate:enableAVEHighPerformanceProfile:]", "MOVStreamOutputSettings.mm", 119, "configuration");
  v9 = objc_msgSend((id)objc_opt_class(), "encoderTypeFromStreamData:", a3);
  objc_msgSend(v8, "objectForKey:", CFSTR("ExpectedFrameRateForStream"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    a4 = v12;
  }
  v13 = v9 - 1;
  v14 = 0;
  switch(v13)
  {
    case 0:
      +[MOVStreamOutputSettings slimSettings:frameRate:](MOVStreamOutputSettings, "slimSettings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 3:
      +[MOVStreamOutputSettings hevc10bitMonochromeLosslessSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc10bitMonochromeLosslessSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      +[MOVStreamOutputSettings hevc10bitMonochromeSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc10bitMonochromeSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
      +[MOVStreamOutputSettings hevc8bitMonochromeLosslessSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc8bitMonochromeLosslessSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 6:
      +[MOVStreamOutputSettings hevc8bitMonochromeSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc8bitMonochromeSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 7:
      +[MOVStreamOutputSettings h264Settings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "h264Settings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 8:
      +[MOVStreamOutputSettings hevcColorSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevcColorSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 9:
      +[MOVStreamOutputSettings hevc8bitWithAlphaLosslessSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc8bitWithAlphaLosslessSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 10:
      +[MOVStreamOutputSettings hevc8bitWithAlphaSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevc8bitWithAlphaSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 11:
      +[MOVStreamOutputSettings hevcColorLosslessSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevcColorLosslessSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 13:
      +[MOVStreamOutputSettings prores4444Settings:frameRate:](MOVStreamOutputSettings, "prores4444Settings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 14:
      +[MOVStreamOutputSettings prores422Settings:frameRate:](MOVStreamOutputSettings, "prores422Settings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 15:
      +[MOVStreamOutputSettings audioSettings:](MOVStreamOutputSettings, "audioSettings:", a3);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 16:
      goto LABEL_25;
    case 17:
      +[MOVStreamOutputSettings customEncoderSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "customEncoderSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 26:
    case 27:
    case 33:
    case 34:
      +[MOVStreamOutputSettings generalHEVCColorSettings:frameRate:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "generalHEVCColorSettings:frameRate:enableAVEHighPerformanceProfile:", a3, v5, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v14 = v15;
      objc_msgSend(v15, "applyAdditionalCompressionPropertiesFromRecordingConfig:", v8);
      goto LABEL_25;
    case 28:
      +[MOVStreamOutputSettings proresRAWSettings:frameRate:](MOVStreamOutputSettings, "proresRAWSettings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 29:
      +[MOVStreamOutputSettings proresRAWHQSettings:frameRate:](MOVStreamOutputSettings, "proresRAWHQSettings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 32:
      +[MOVStreamOutputSettings jpegSettings:frameRate:](MOVStreamOutputSettings, "jpegSettings:frameRate:", a3, a4);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v14 = (void *)v16;
LABEL_25:

      return v14;
    default:
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid encoder type."), 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v18);
  }
}

- (void)applyAdditionalCompressionPropertiesFromRecordingConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[MOVStreamOutputSettings settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MOVStreamOutputSettings settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDB22C8];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDB22C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[MOVStreamOutputSettings addAdditionalCompressionProperties:recordingConfig:](MOVStreamOutputSettings, "addAdditionalCompressionProperties:recordingConfig:", v8, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MOVStreamOutputSettings settings](self, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "setObject:forKey:", v9, v7);
      v12 = (void *)objc_msgSend(v11, "copy");
      -[MOVStreamOutputSettings setSettings:](self, "setSettings:", v12);

LABEL_7:
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[MOVStreamOutputSettings config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MOVStreamOutputSettings config](self, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[MOVStreamOutputSettings addAdditionalCompressionProperties:recordingConfig:](MOVStreamOutputSettings, "addAdditionalCompressionProperties:recordingConfig:", v8, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MOVStreamOutputSettings config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSessionProperties:", v9);
      goto LABEL_7;
    }
LABEL_8:

  }
}

+ (id)customEncoderSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  void *v6;
  MOVStreamOutputSettings *v7;
  MOVStreamOutputSettings *v8;

  objc_msgSend(a3->var5, "objectForKey:", CFSTR("CustomEncoderConfig"), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v6);
  else
    v7 = -[MOVStreamOutputSettings initWithFrameRate:useCustomEncoderConfig:]([MOVStreamOutputSettings alloc], "initWithFrameRate:useCustomEncoderConfig:", 1, a4);
  v8 = v7;

  return v8;
}

+ (id)audioSettings:(StreamRecordingData *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MOVStreamOutputSettings *v9;
  void *v10;
  MOVStreamOutputSettings *v11;

  v4 = (void *)objc_opt_new();
  objc_msgSend(a3->var5, "objectForKey:", CFSTR("AudioFormatObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  }
  objc_msgSend(a3->var5, "objectForKey:", CFSTR("AdditionalAudioSettings"));
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

+ (BOOL)isLosslessColorEncoding:(int)a3
{
  return (a3 < 0x24) & (0x811501000uLL >> a3);
}

+ (BOOL)isBitDepth10Encoding:(int)a3
{
  return (a3 - 19) < 6;
}

+ (int64_t)chromaSamplingEncoding:(int)a3
{
  if ((a3 - 21) > 0xE)
    return 0;
  else
    return qword_2106E47F8[a3 - 21];
}

+ (id)generalHEVCColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL8 v5;
  CMVideoDimensions Dimensions;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  v9 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  v11 = v10;
  objc_msgSend(a3->var5, "objectForKey:", CFSTR("StreamEncoderType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  return +[MOVStreamOutputSettings hevcColorSettingsLossless:quality:bitsPerSecond:bitDepth10:chromaSampling:frameRate:dimensions:enableAVEHighPerformanceProfile:](MOVStreamOutputSettings, "hevcColorSettingsLossless:quality:bitsPerSecond:bitDepth10:chromaSampling:frameRate:dimensions:enableAVEHighPerformanceProfile:", +[MOVStreamOutputSettings isLosslessColorEncoding:](MOVStreamOutputSettings, "isLosslessColorEncoding:", v13), v9, +[MOVStreamOutputSettings isBitDepth10Encoding:](MOVStreamOutputSettings, "isBitDepth10Encoding:", v13), +[MOVStreamOutputSettings chromaSamplingEncoding:](MOVStreamOutputSettings, "chromaSamplingEncoding:", v13), Dimensions, v5, v11,
           a4);
}

+ (id)hevcColorSettingsLossless:(BOOL)a3 quality:(double)a4 bitsPerSecond:(unint64_t)a5 bitDepth10:(BOOL)a6 chromaSampling:(int64_t)a7 frameRate:(double)a8 dimensions:(id)a9 enableAVEHighPerformanceProfile:(BOOL)a10
{
  _BOOL4 v10;
  _BOOL4 v13;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  MOVStreamOutputSettings *v32;
  int v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[2];
  _QWORD v38[3];

  v10 = a10;
  v13 = a6;
  v17 = a3;
  v38[2] = *MEMORY[0x24BDAC8D0];
  v37[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v18;
  v37[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (v17)
  {
    objc_msgSend(v21, "setObject:forKey:", &unk_24CA5BDF8, *MEMORY[0x24BDB2350]);
  }
  else
  {
    if (a4 >= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, *MEMORY[0x24BDB2350]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v22, *MEMORY[0x24BDB2250]);
    }

  }
  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "disableFrameReordering");

  if (v24)
    objc_msgSend(v21, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (!v13)
  {
    switch(a7)
    {
      case 0:
        v25 = CFSTR("HEVC_Main_AutoLevel");
        goto LABEL_18;
      case 2:
        v25 = CFSTR("HEVC_Main444_AutoLevel");
        goto LABEL_18;
      case 1:
        objc_msgSend(v21, "setObject:forKey:", &unk_24CA5BCE8, CFSTR("OutputBitDepth"));
        v26 = 0x24BDD1000;
        v25 = CFSTR("HEVC_Main42210_AutoLevel");
        goto LABEL_19;
    }
    v34 = 477;
LABEL_24:
    __assert_rtn("+[MOVStreamOutputSettings hevcColorSettingsLossless:quality:bitsPerSecond:bitDepth10:chromaSampling:frameRate:dimensions:enableAVEHighPerformanceProfile:]", "MOVStreamOutputSettings.mm", v34, "0");
  }
  if ((unint64_t)a7 >= 3)
  {
    v34 = 460;
    goto LABEL_24;
  }
  v25 = off_24CA450B8[a7];
LABEL_18:
  v26 = 0x24BDD1000uLL;
LABEL_19:
  objc_msgSend(v21, "setObject:forKey:", v25, *MEMORY[0x24BDB2348]);
  if (v10)
  {
    objc_msgSend(v21, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v21, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v21, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v27 = *MEMORY[0x24BDB2268];
  v36[0] = *MEMORY[0x24BDB22A0];
  v28 = *MEMORY[0x24BDB2368];
  v35[0] = v27;
  v35[1] = v28;
  objc_msgSend(*(id *)(v26 + 1760), "numberWithInt:", a9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v29;
  v35[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(*(id *)(v26 + 1760), "numberWithInt:", HIDWORD(*(unint64_t *)&a9));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = *MEMORY[0x24BDB22C8];
  v36[2] = v30;
  v36[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v31);
  return v32;
}

+ (id)proresRAWSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  CMVideoDimensions Dimensions;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MOVStreamOutputSettings *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  v5 = *MEMORY[0x24BDB2268];
  v13[0] = CFSTR("aprn");
  v6 = *MEMORY[0x24BDB2368];
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v9);
  return v10;
}

+ (id)proresRAWHQSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  CMVideoDimensions Dimensions;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MOVStreamOutputSettings *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  v5 = *MEMORY[0x24BDB2268];
  v13[0] = CFSTR("aprh");
  v6 = *MEMORY[0x24BDB2368];
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v9);
  return v10;
}

+ (id)prores4444Settings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  unint64_t Dimensions;
  id var5;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MOVStreamOutputSettings *v17;
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  var5 = a3->var5;
  if (var5
    && (objc_msgSend(var5, "objectForKey:", CFSTR("ProResEncodingQuality")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(a3->var5, "objectForKey:", CFSTR("ProResEncodingQuality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

    v10 = (__CFString *)(id)*MEMORY[0x24BDB2290];
    v11 = v10;
    if (v9 != 1)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD1118], CFSTR("ProRes4444 only supports high and medium quality setting."), 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v19);
      }

      v11 = CFSTR("ap4x");
    }
  }
  else
  {
    v11 = (__CFString *)(id)*MEMORY[0x24BDB2290];
  }
  v12 = *MEMORY[0x24BDB2268];
  v21[0] = v11;
  v13 = *MEMORY[0x24BDB2368];
  v20[0] = v12;
  v20[1] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v20[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v16);
  return v17;
}

+ (id)prores422Settings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  unint64_t Dimensions;
  id var5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  MOVStreamOutputSettings *v18;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  var5 = a3->var5;
  if (var5
    && (objc_msgSend(var5, "objectForKey:", CFSTR("ProResEncodingQuality")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(a3->var5, "objectForKey:", CFSTR("ProResEncodingQuality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (int)objc_msgSend(v8, "intValue");

    v10 = (id)*MEMORY[0x24BDB2270];
    switch(v9)
    {
      case 3:
        v11 = (id *)MEMORY[0x24BDB2288];
        goto LABEL_10;
      case 2:
        v11 = (id *)MEMORY[0x24BDB2280];
        goto LABEL_10;
      case 0:
        v11 = (id *)MEMORY[0x24BDB2278];
LABEL_10:
        v12 = *v11;

        v10 = v12;
        break;
    }
  }
  else
  {
    v10 = (id)*MEMORY[0x24BDB2270];
  }
  v13 = *MEMORY[0x24BDB2268];
  v21[0] = v10;
  v14 = *MEMORY[0x24BDB2368];
  v20[0] = v13;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v17);
  return v18;
}

+ (id)hevc10bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  char v9;
  MOVStreamOutputSettings *v10;
  unint64_t Dimensions;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[8];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[3];

  v5 = a5;
  v29[2] = *MEMORY[0x24BDAC8D0];
  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "force10bitMonoByVT");

  if ((v9 & 1) != 0)
  {
    v10 = -[MOVStreamOutputSettings initWithFrameRate:]([MOVStreamOutputSettings alloc], "initWithFrameRate:", a4);
  }
  else
  {
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
    v28[0] = *MEMORY[0x24BDB22E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v28[1] = *MEMORY[0x24BDB2318];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    +[MOVStreamIOUtility AVEProfileLevel10BitMonochrome](MOVStreamIOUtility, "AVEProfileLevel10BitMonochrome");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2348]);
    +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v17, "disableFrameReordering");

    if ((_DWORD)v14)
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_DEBUG, "MOVStreamWriter: Disable 'AllowFrameReordering' related to r50244907.", v25, 2u);
      }

    }
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
    objc_msgSend(v15, "setObject:forKey:", &unk_24CA5BDF8, *MEMORY[0x24BDB2350]);
    if (v5)
    {
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
    }
    v19 = *MEMORY[0x24BDB2268];
    v27[0] = *MEMORY[0x24BDB22A0];
    v20 = *MEMORY[0x24BDB2368];
    v26[0] = v19;
    v26[1] = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    v26[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = *MEMORY[0x24BDB22C8];
    v27[2] = v22;
    v27[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v23);
  }
  return v10;
}

+ (id)hevc10bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  MOVStreamOutputSettings *v11;

  v5 = a5;
  v7 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  if (v8 >= 0.0)
    +[MOVStreamEncoderConfig monochrome10BitEncoderConfigUsingAVEWithQuality:](MOVStreamEncoderConfig, "monochrome10BitEncoderConfigUsingAVEWithQuality:");
  else
    +[MOVStreamEncoderConfig monochrome10BitEncoderConfigUsingAVEWithBitrate:](MOVStreamEncoderConfig, "monochrome10BitEncoderConfigUsingAVEWithBitrate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "enableAVEHighPerformanceProfile");
  v11 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v10);

  return v11;
}

+ (id)hevcColorLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t Dimensions;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  MOVStreamOutputSettings *v20;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[3];
  _QWORD v25[4];

  v5 = a5;
  v25[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v8 = *MEMORY[0x24BDB2350];
  v25[0] = &unk_24CA5BDF8;
  v9 = *MEMORY[0x24BDB22E0];
  v24[0] = v8;
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  v24[2] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "disableFrameReordering");

  if ((_DWORD)v11)
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v13, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v15 = *MEMORY[0x24BDB2268];
  v23[0] = *MEMORY[0x24BDB22A0];
  v16 = *MEMORY[0x24BDB2368];
  v22[0] = v15;
  v22[1] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = *MEMORY[0x24BDB22C8];
  v23[2] = v18;
  v23[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v19);
  return v20;
}

+ (id)hevc8bitMonochromeLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  const opaqueCMFormatDescription *v7;
  unint64_t Dimensions;
  void *v9;
  int v10;
  MOVStreamOutputSettings *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[3];
  _QWORD v28[4];

  v5 = a5;
  v28[3] = *MEMORY[0x24BDAC8D0];
  v7 = (const opaqueCMFormatDescription *)objc_msgSend(a3->var11, "createTrackFormatDescriptionFromStreamData:");
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v7);
  if (v7)
    CFRelease(v7);
  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "forceLossless8bitMonoByVT");

  if (v10)
  {
    v11 = -[MOVStreamOutputSettings initWithFrameRate:]([MOVStreamOutputSettings alloc], "initWithFrameRate:", a4);
  }
  else
  {
    v12 = *MEMORY[0x24BDB2350];
    v28[0] = &unk_24CA5BDF8;
    v13 = *MEMORY[0x24BDB22E0];
    v27[0] = v12;
    v27[1] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    v27[2] = *MEMORY[0x24BDB2318];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = objc_msgSend(v18, "disableFrameReordering");

    if ((_DWORD)v15)
      objc_msgSend(v17, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
    objc_msgSend(v17, "setObject:forKey:", *MEMORY[0x24BDF97F8], *MEMORY[0x24BDB2348]);
    if (v5)
    {
      objc_msgSend(v17, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
      objc_msgSend(v17, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
      objc_msgSend(v17, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
    }
    v19 = *MEMORY[0x24BDB2268];
    v26[0] = *MEMORY[0x24BDB22A0];
    v20 = *MEMORY[0x24BDB2368];
    v25[0] = v19;
    v25[1] = v20;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    v25[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = *MEMORY[0x24BDB22C8];
    v26[2] = v22;
    v26[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v23);
  }
  return v11;
}

+ (id)hevc8bitMonochromeSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  const opaqueCMFormatDescription *v8;
  unint64_t Dimensions;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  MOVStreamOutputSettings *v25;
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[3];

  v5 = a5;
  v30[2] = *MEMORY[0x24BDAC8D0];
  v8 = (const opaqueCMFormatDescription *)objc_msgSend(a3->var11, "createTrackFormatDescriptionFromStreamData:");
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v8);
  if (v8)
    CFRelease(v8);
  v10 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  v12 = v11;
  v29[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v29[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v12 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x24BDB2350]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x24BDB2250]);
  }

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "disableFrameReordering");

  if (v19)
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  objc_msgSend(v16, "setObject:forKey:", *MEMORY[0x24BDF97F8], *MEMORY[0x24BDB2348]);
  v20 = *MEMORY[0x24BDB2268];
  v28[0] = *MEMORY[0x24BDB22A0];
  v21 = *MEMORY[0x24BDB2368];
  v27[0] = v20;
  v27[1] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v27[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = *MEMORY[0x24BDB22C8];
  v28[2] = v23;
  v28[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v24);
  return v25;
}

+ (id)hevcColorSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t Dimensions;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  MOVStreamOutputSettings *v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[3];

  v5 = a5;
  v29[2] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v9 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  v11 = v10;
  v28[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v28[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v11 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2350]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2250]);
  }

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "disableFrameReordering");

  if (v18)
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v19 = *MEMORY[0x24BDB2268];
  v27[0] = *MEMORY[0x24BDB22A0];
  v20 = *MEMORY[0x24BDB2368];
  v26[0] = v19;
  v26[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = *MEMORY[0x24BDB22C8];
  v27[2] = v22;
  v27[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v23);
  return v24;
}

+ (id)hevc8bitWithAlphaLosslessSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t Dimensions;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  MOVStreamOutputSettings *v18;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[5];

  v5 = a5;
  v23[4] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v22[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v22[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  v23[2] = &unk_24CA5BDF8;
  v22[2] = CFSTR("Quality");
  v22[3] = CFSTR("AllowFrameReordering");
  v23[3] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "disableFrameReordering");

  if ((_DWORD)v9)
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v13 = *MEMORY[0x24BDB2268];
  v21[0] = *MEMORY[0x24BDB22A8];
  v14 = *MEMORY[0x24BDB2368];
  v20[0] = v13;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = *MEMORY[0x24BDB22C8];
  v21[2] = v16;
  v21[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v17);
  return v18;
}

+ (id)hevc8bitWithAlphaSettings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t Dimensions;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  MOVStreamOutputSettings *v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[4];

  v5 = a5;
  v29[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v9 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  v11 = v10;
  v28[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v28[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = CFSTR("AllowFrameReordering");
  v29[1] = v13;
  v29[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v11 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2350]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2250]);
  }

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "disableFrameReordering");

  if (v18)
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v19 = *MEMORY[0x24BDB2268];
  v27[0] = *MEMORY[0x24BDB22A8];
  v20 = *MEMORY[0x24BDB2368];
  v26[0] = v19;
  v26[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = *MEMORY[0x24BDB22C8];
  v27[2] = v22;
  v27[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v23);
  return v24;
}

+ (id)h264Settings:(StreamRecordingData *)a3 frameRate:(double)a4 enableAVEHighPerformanceProfile:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t Dimensions;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  MOVStreamOutputSettings *v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[3];

  v5 = a5;
  v29[2] = *MEMORY[0x24BDAC8D0];
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3->var0);
  v9 = objc_msgSend((id)objc_opt_class(), "getBitsPerSecondForColorStream:frameRate:", a3, a4);
  objc_msgSend((id)objc_opt_class(), "getQualitySetting:", a3);
  v11 = v10;
  v28[0] = *MEMORY[0x24BDB22E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  v28[1] = *MEMORY[0x24BDB2318];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v11 >= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2350]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x24BDB2250]);
  }

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "disableFrameReordering");

  if (v18)
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AllowFrameReordering"));
  if (v5)
  {
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF9348]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF92D8]);
    objc_msgSend(v15, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDF91F8]);
  }
  v19 = *MEMORY[0x24BDB2268];
  v27[0] = *MEMORY[0x24BDB2298];
  v20 = *MEMORY[0x24BDB2368];
  v26[0] = v19;
  v26[1] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(Dimensions));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = *MEMORY[0x24BDB22C8];
  v27[2] = v22;
  v27[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v23);
  return v24;
}

+ (id)slimSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  CMVideoDimensions Dimensions;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id var5;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MOVStreamOutputSettings *v17;
  const __CFString *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  v6 = *MEMORY[0x24BDB2268];
  v22[0] = CFSTR("slim");
  v7 = *MEMORY[0x24BDB2368];
  v21[0] = v6;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  v21[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  var5 = a3->var5;
  if (var5)
  {
    objc_msgSend(var5, "objectForKey:", CFSTR("UseSlimXCompression"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      v14 = (void *)objc_msgSend(v10, "mutableCopy");
      v19 = CFSTR("InternalCodecType");
      v20 = &unk_24CA5BD00;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x24BDB22C8]);
      v16 = objc_msgSend(v14, "copy");

      v10 = (void *)v16;
    }
  }
  v17 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v10);

  return v17;
}

+ (id)jpegSettings:(StreamRecordingData *)a3 frameRate:(double)a4
{
  CMVideoDimensions Dimensions;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id var5;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MOVStreamOutputSettings *v20;
  uint64_t v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  v6 = *MEMORY[0x24BDB2268];
  v25[0] = *MEMORY[0x24BDB22B0];
  v7 = *MEMORY[0x24BDB2368];
  v24[0] = v6;
  v24[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  v24[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  var5 = a3->var5;
  if (var5)
  {
    objc_msgSend(var5, "objectForKey:", CFSTR("EncodingQuality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
      v15 = v14;
      v16 = (void *)objc_msgSend(v10, "mutableCopy");
      v22 = *MEMORY[0x24BDB2350];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BDB22C8]);
      v19 = (void *)objc_msgSend(v16, "copy");

    }
    else
    {
      v19 = v10;
    }

  }
  else
  {
    v19 = v10;
  }
  v20 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v19);

  return v20;
}

+ (unint64_t)getBitsPerSecondForColorStream:(StreamRecordingData *)a3 frameRate:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  CMVideoDimensions Dimensions;
  void *v11;
  uint64_t v12;

  v6 = a3->var5;
  v7 = v6;
  if (v6
    && (objc_msgSend(v6, "objectForKey:", CFSTR("ColorStreamBitrate")),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = objc_msgSend((id)objc_opt_class(), "applyBitrateModifiersTo:", objc_msgSend(v8, "integerValue"));

  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
    objc_msgSend(v7, "objectForKey:", CFSTR("StreamEncoderType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    v9 = objc_msgSend((id)objc_opt_class(), "applyBitrateModifiersTo:", +[MOVStreamIOUtility getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:](MOVStreamIOUtility, "getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:", Dimensions, v12, a4));
  }

  return v9;
}

+ (double)getQualitySetting:(StreamRecordingData *)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  v3 = a3->var5;
  v4 = v3;
  v5 = -1.0;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("EncodingQuality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:");
      v5 = v8;

    }
  }

  return v5;
}

+ (unint64_t)applyBitrateModifiersTo:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bitrateMultiplier");
  v6 = v5;

  +[MOVStreamOptions sharedOptions](MOVStreamOptions, "sharedOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "bitrateOverride");
  v9 = vcvtad_u64_f64(v6 * (double)a3);
  if (v6 > 0.0)
    a3 = v9;

  if (v8)
    return v8;
  else
    return a3;
}

+ (int)matchDeprecatedType:(int)a3
{
  int v3;

  if (a3 == 3)
    v3 = 4;
  else
    v3 = a3;
  if (a3 == 13)
    v3 = 1;
  if (a3 == 2)
    return 1;
  else
    return v3;
}

+ (id)addAdditionalCompressionProperties:(id)a3 recordingConfig:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("AdditionalCompressionProperties"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)v7;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  v9 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v9, "addEntriesFromDictionary:", MEMORY[0x24BDBD1B8]);
  objc_msgSend(v9, "addEntriesFromDictionary:", v8);
  objc_msgSend(v6, "objectForKey:", CFSTR("AllowFrameReordering"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x24BDF91F8]);

  }
  v13 = (void *)objc_msgSend(v9, "copy");

  return v13;
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MOVStreamEncoderConfig)config
{
  return (MOVStreamEncoderConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)useCustomEncoderConfig
{
  return self->_useCustomEncoderConfig;
}

- (double)expectedFrameRate
{
  return self->_expectedFrameRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
