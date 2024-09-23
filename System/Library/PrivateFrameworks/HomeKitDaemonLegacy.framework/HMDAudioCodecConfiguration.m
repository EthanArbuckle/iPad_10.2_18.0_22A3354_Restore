@implementation HMDAudioCodecConfiguration

- (HMDAudioCodecConfiguration)initWithAudioCodecGroup:(id)a3 codecParameter:(id)a4
{
  id v7;
  id v8;
  HMDAudioCodecConfiguration *v9;
  HMDAudioCodecConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAudioCodecConfiguration;
  v9 = -[HMDAudioCodecConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_codecGroup, a3);
    objc_storeStrong((id *)&v10->_audioCodecParameters, a4);
  }

  return v10;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  HMDAudioCodecGroup *v6;
  void *v7;
  HMDAudioCodecGroup *v8;
  HMDAudioCodecGroup *codecGroup;
  HMDAudioCodecParameters *v10;
  void *v11;
  HMDAudioCodecParameters *v12;
  HMDAudioCodecParameters *audioCodecParameters;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kAudioCodecConfiguration__CodecGroupType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("kAudioCodecConfiguration__CodecParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = (uint64_t)v3;
  v23[1] = (uint64_t)v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPTLVBase _parse:](self, "_parse:", v5))
  {
    v6 = [HMDAudioCodecGroup alloc];
    objc_msgSend(v3, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDAudioCodecGroup initWithAudioCodecGroup:](v6, "initWithAudioCodecGroup:", objc_msgSend(v7, "unsignedIntegerValue"));
    codecGroup = self->_codecGroup;
    self->_codecGroup = v8;

    v10 = [HMDAudioCodecParameters alloc];
    objc_msgSend(v4, "field");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HAPTLVBase initWithTLVData:](v10, "initWithTLVData:", v11);
    audioCodecParameters = self->_audioCodecParameters;
    self->_audioCodecParameters = v12;

    v21 = checkForParseResult(1, v14, v15, v16, v17, v18, v19, v20, (uint64_t)self->_audioCodecParameters, v23[0]);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDAudioCodecConfiguration codecGroup](self, "codecGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "codec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v6);

  -[HMDAudioCodecConfiguration audioCodecParameters](self, "audioCodecParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
  objc_msgSend(v3, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v9;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDAudioCodecConfiguration codecGroup](self, "codecGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audiocodec = %@ "), v6, v10);

  -[HMDAudioCodecConfiguration audioCodecParameters](self, "audioCodecParameters");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptionWithIndent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ codecParameters = %@ "), v6, v11);

}

- (HMDAudioCodecConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDAudioCodecConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDAudioCodecGroup *codecGroup;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDAudioCodecParameters *audioCodecParameters;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAudioCodecConfiguration;
  v5 = -[HMDAudioCodecConfiguration init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kAudioCodecConfiguration__CodecGroupType"));
    v9 = objc_claimAutoreleasedReturnValue();
    codecGroup = v5->_codecGroup;
    v5->_codecGroup = (HMDAudioCodecGroup *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kAudioCodecConfiguration__CodecParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    audioCodecParameters = v5->_audioCodecParameters;
    v5->_audioCodecParameters = (HMDAudioCodecParameters *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAudioCodecConfiguration codecGroup](self, "codecGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAudioCodecConfiguration__CodecGroupType"));

  -[HMDAudioCodecConfiguration audioCodecParameters](self, "audioCodecParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAudioCodecConfiguration__CodecParameters"));

}

- (HMDAudioCodecGroup)codecGroup
{
  return self->_codecGroup;
}

- (HMDAudioCodecParameters)audioCodecParameters
{
  return self->_audioCodecParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCodecParameters, 0);
  objc_storeStrong((id *)&self->_codecGroup, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
