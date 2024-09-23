@implementation MIOMastery

- (MIOMastery)initWithKey:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  MIOMastery *v9;
  MIOMastery *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOMastery;
  v9 = -[MIOMastery init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyKey, a3);
    objc_storeStrong(&v10->_propertyValue, a4);
  }

  return v10;
}

+ (id)masteryLossless
{
  MIOMastery *v2;

  v2 = [MIOMastery alloc];
  return -[MIOMastery initWithKey:value:](v2, "initWithKey:value:", *MEMORY[0x24BDF9338], &unk_24CA5BDC8);
}

+ (id)masteryWithQuality:(double)a3
{
  MIOMastery *v4;
  uint64_t v5;
  void *v6;
  MIOMastery *v7;

  v4 = [MIOMastery alloc];
  v5 = *MEMORY[0x24BDF9338];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIOMastery initWithKey:value:](v4, "initWithKey:value:", v5, v6);

  return v7;
}

+ (id)masteryWithBitrate:(double)a3
{
  MIOMastery *v4;
  uint64_t v5;
  void *v6;
  MIOMastery *v7;

  v4 = [MIOMastery alloc];
  v5 = *MEMORY[0x24BDF9208];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIOMastery initWithKey:value:](v4, "initWithKey:value:", v5, v6);

  return v7;
}

+ (id)masteryFromConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRate:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CMVideoDimensions Dimensions;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("ColorStreamBitrate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    objc_msgSend(v7, "objectForKey:", CFSTR("StreamEncoderType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    v10 = +[MOVStreamIOUtility getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:](MOVStreamIOUtility, "getDefaultBitrateForVideoDimension:atExpectedFramerate:forEncoderType:", Dimensions, v13, a5);
  }
  v14 = v10;
  objc_msgSend(v7, "objectForKey:", CFSTR("EncodingQuality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && (objc_msgSend(v15, "doubleValue"),
        +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:"),
        v16 >= 0.0))
  {
    +[MIOMastery masteryWithQuality:](MIOMastery, "masteryWithQuality:");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MIOMastery masteryWithBitrate:](MIOMastery, "masteryWithBitrate:", (double)v14);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

- (NSString)propertyKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)propertyValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyValue, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);
}

@end
