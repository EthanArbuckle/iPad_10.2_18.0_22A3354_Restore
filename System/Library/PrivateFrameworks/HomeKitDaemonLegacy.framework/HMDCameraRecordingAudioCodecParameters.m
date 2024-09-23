@implementation HMDCameraRecordingAudioCodecParameters

- (HMDCameraRecordingAudioCodecParameters)initWithChannelCount:(id)a3 bitRateModes:(id)a4 audioSampleRates:(id)a5 maxAudioBitRate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraRecordingAudioCodecParameters *v15;
  HMDCameraRecordingAudioCodecParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingAudioCodecParameters;
  v15 = -[HMDCameraRecordingAudioCodecParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_audioChannelCount, a3);
    objc_storeStrong((id *)&v16->_bitRateModes, a4);
    objc_storeStrong((id *)&v16->_audioSampleRates, a5);
    objc_storeStrong((id *)&v16->_maxAudioBitRate, a6);
  }

  return v16;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSArray *v10;
  NSArray *bitRateModes;
  NSArray *v12;
  NSArray *audioSampleRates;
  NSNumber *v14;
  NSNumber *audioChannelCount;
  NSNumber *v16;
  NSNumber *maxAudioBitRate;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kAudioCodecParametersChannels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 2, CFSTR("kAudioCodecParametersBitRateModes"), &__block_literal_global_179624);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 3, CFSTR("kAudioCodecParametersSampleRates"), &__block_literal_global_92_179625);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 4, CFSTR("kAudioCodecParametersMaxAudioBitrate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = v4;
  v20[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPTLVBase _parseMandatory:optional:](self, "_parseMandatory:optional:", v7, v8);
  if (v9)
  {
    objc_msgSend(v4, "field");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bitRateModes = self->_bitRateModes;
    self->_bitRateModes = v10;

    objc_msgSend(v5, "field");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    audioSampleRates = self->_audioSampleRates;
    self->_audioSampleRates = v12;

    objc_msgSend(v3, "field");
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    audioChannelCount = self->_audioChannelCount;
    self->_audioChannelCount = v14;

  }
  objc_msgSend(v6, "field");
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  maxAudioBitRate = self->_maxAudioBitRate;
  self->_maxAudioBitRate = v16;

  return v9;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 1, v4);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingAudioCodecParameters bitRateModes](self, "bitRateModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 1, v8);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 1, v12);

  -[HMDCameraRecordingAudioCodecParameters maxAudioBitRate](self, "maxAudioBitRate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 4, 4, v13);

  objc_msgSend(v3, "serialize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v14;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@channels = %@ "), v6, v9);

  -[HMDCameraRecordingAudioCodecParameters bitRateModes](self, "bitRateModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@bitRateModes = %@"), v6, v11);

  -[HMDCameraRecordingAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@audioSampleRates = %@"), v6, v13);

  -[HMDCameraRecordingAudioCodecParameters maxAudioBitRate](self, "maxAudioBitRate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@maxAudioBitRate = %@"), v6, v14);

}

- (HMDCameraRecordingAudioCodecParameters)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingAudioCodecParameters *v5;
  uint64_t v6;
  NSNumber *audioChannelCount;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *bitRateModes;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *audioSampleRates;
  uint64_t v18;
  NSNumber *maxAudioBitRate;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraRecordingAudioCodecParameters;
  v5 = -[HMDCameraRecordingAudioCodecParameters init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAudioCodecParametersChannels"));
    v6 = objc_claimAutoreleasedReturnValue();
    audioChannelCount = v5->_audioChannelCount;
    v5->_audioChannelCount = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kAudioCodecParametersBitRateModes"));
    v11 = objc_claimAutoreleasedReturnValue();
    bitRateModes = v5->_bitRateModes;
    v5->_bitRateModes = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("kAudioCodecParametersSampleRates"));
    v16 = objc_claimAutoreleasedReturnValue();
    audioSampleRates = v5->_audioSampleRates;
    v5->_audioSampleRates = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAudioCodecParametersMaxAudioBitrate"));
    v18 = objc_claimAutoreleasedReturnValue();
    maxAudioBitRate = v5->_maxAudioBitRate;
    v5->_maxAudioBitRate = (NSNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDCameraRecordingAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAudioCodecParametersChannels"));

  -[HMDCameraRecordingAudioCodecParameters bitRateModes](self, "bitRateModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAudioCodecParametersBitRateModes"));

  -[HMDCameraRecordingAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kAudioCodecParametersSampleRates"));

  -[HMDCameraRecordingAudioCodecParameters maxAudioBitRate](self, "maxAudioBitRate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kAudioCodecParametersMaxAudioBitrate"));

}

- (NSNumber)audioChannelCount
{
  return self->_audioChannelCount;
}

- (NSArray)bitRateModes
{
  return self->_bitRateModes;
}

- (NSArray)audioSampleRates
{
  return self->_audioSampleRates;
}

- (NSNumber)maxAudioBitRate
{
  return self->_maxAudioBitRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAudioBitRate, 0);
  objc_storeStrong((id *)&self->_audioSampleRates, 0);
  objc_storeStrong((id *)&self->_bitRateModes, 0);
  objc_storeStrong((id *)&self->_audioChannelCount, 0);
}

HMDCameraRecordingAudioSampleRate *__59__HMDCameraRecordingAudioCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingAudioSampleRate *v3;

  v2 = a2;
  v3 = -[HMDCameraRecordingAudioSampleRate initWithTLVData:]([HMDCameraRecordingAudioSampleRate alloc], "initWithTLVData:", v2);

  return v3;
}

HMDCameraRecordingAudioBitRateMode *__59__HMDCameraRecordingAudioCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingAudioBitRateMode *v3;

  v2 = a2;
  v3 = -[HMDCameraRecordingAudioBitRateMode initWithTLVData:]([HMDCameraRecordingAudioBitRateMode alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
