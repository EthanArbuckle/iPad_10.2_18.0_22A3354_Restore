@implementation MIOProResStreamOutputSettings

+ (BOOL)supportsEncoderType:(int)a3
{
  return (a3 < 0x1F) & (0x6000C000u >> a3);
}

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL8 v7;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a6;
  v9 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("StreamEncoderType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (v9
    && (objc_msgSend(v9, "objectForKey:", CFSTR("ProResEncodingQuality")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("ProResEncodingQuality"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (int)objc_msgSend(v13, "intValue");

  }
  else
  {
    v14 = 1;
  }
  objc_msgSend((id)objc_opt_class(), "outputSettingsProResEncoderType:quality:formatDescription:preferEncoderConfig:", v11, v14, a4, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)outputSettingsProResEncoderType:(int)a3 quality:(int64_t)a4 formatDescription:(opaqueCMFormatDescription *)a5 preferEncoderConfig:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v8;
  __CFString *v9;
  __CFString **v10;
  __CFString **v11;
  uint64_t v12;
  MOVStreamEncoderConfig *v13;
  MOVStreamEncoderConfig *v14;
  MOVStreamOutputSettings *v15;
  CMVideoDimensions Dimensions;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v6 = a6;
  v26[3] = *MEMORY[0x24BDAC8D0];
  if (a3 == 29)
  {
    v8 = CFSTR("aprn");
    goto LABEL_20;
  }
  if (a3 == 30)
  {
    v8 = CFSTR("aprh");
    goto LABEL_20;
  }
  if (a4 == 3)
  {
    v10 = (__CFString **)MEMORY[0x24BDB2288];
LABEL_13:
    v9 = *v10;
    if (a3 != 15)
      v9 = 0;
    goto LABEL_19;
  }
  if (a4 == 2)
  {
    v10 = (__CFString **)MEMORY[0x24BDB2280];
    goto LABEL_13;
  }
  if (a4)
  {
    v11 = (__CFString **)MEMORY[0x24BDB2270];
    if (a3 != 15)
      v11 = (__CFString **)MEMORY[0x24BDB2290];
    v9 = *v11;
  }
  else
  {
    v9 = (__CFString *)*MEMORY[0x24BDB2278];
    if (a3 != 15)
      v9 = CFSTR("ap4x");
  }
LABEL_19:
  v8 = v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD1118], CFSTR("ProRes4444 only supports high and medium quality setting."), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
LABEL_20:
  if (v6)
  {
    v12 = objc_msgSend((id)objc_opt_class(), "cmCodecTypeFromAVCodecType:", v8);
    if (!(_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD1118], CFSTR("Unknown Prores Codec."), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
    v13 = [MOVStreamEncoderConfig alloc];
    v14 = -[MOVStreamEncoderConfig initWithCodecType:encoderSpecification:sessionProperties:](v13, "initWithCodecType:encoderSpecification:sessionProperties:", v12, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8]);
    v15 = -[MOVStreamOutputSettings initWithConfig:]([MOVStreamOutputSettings alloc], "initWithConfig:", v14);

  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a5);
    v17 = *MEMORY[0x24BDB2268];
    v26[0] = v8;
    v18 = *MEMORY[0x24BDB2368];
    v25[0] = v17;
    v25[1] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v19;
    v25[2] = *MEMORY[0x24BDB2310];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[MOVStreamOutputSettings initWithSettings:]([MOVStreamOutputSettings alloc], "initWithSettings:", v21);
  }

  return v15;
}

+ (unsigned)cmCodecTypeFromAVCodecType:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  v4 = 1634755432;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB2278]) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB2280]) & 1) != 0)
    {
      v4 = 1634755443;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB2288]) & 1) != 0)
    {
      v4 = 1634755439;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB2270]) & 1) != 0)
    {
      v4 = 1634755438;
    }
    else
    {
      v4 = 1634743400;
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB2290]) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ap4x")) & 1) != 0)
        {
          v4 = 1634743416;
        }
        else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aprn")) & 1) != 0)
        {
          v4 = 1634759278;
        }
        else if (objc_msgSend(v3, "isEqualToString:", CFSTR("aprh")))
        {
          v4 = 1634759272;
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }

  return v4;
}

@end
