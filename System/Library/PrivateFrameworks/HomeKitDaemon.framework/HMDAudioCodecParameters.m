@implementation HMDAudioCodecParameters

- (HMDAudioCodecParameters)initWithChannelCount:(id)a3 bitRateSetting:(id)a4 audioSampleRate:(id)a5 rtpPtime:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDAudioCodecParameters *v15;
  HMDAudioCodecParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDAudioCodecParameters;
  v15 = -[HMDAudioCodecParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_audioChannelCount, a3);
    objc_storeStrong((id *)&v16->_bitRateSettings, a4);
    objc_storeStrong((id *)&v16->_audioSampleRates, a5);
    objc_storeStrong((id *)&v16->_rtpPtime, a6);
  }

  return v16;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSNumber *v8;
  NSNumber *audioChannelCount;
  NSArray *v10;
  NSArray *bitRateSettings;
  NSArray *v12;
  NSArray *audioSampleRates;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kAudioCodecParameters__AudioChannels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 2, CFSTR("kAudioCodecParameters__Bitrate"), &__block_literal_global_308);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 3, CFSTR("kAudioCodecParameters__SampleRate"), &__block_literal_global_310);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = v4;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v3, "field");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    audioChannelCount = self->_audioChannelCount;
    self->_audioChannelCount = v8;

    objc_msgSend(v4, "field");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bitRateSettings = self->_bitRateSettings;
    self->_bitRateSettings = v10;

    objc_msgSend(v5, "field");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    audioSampleRates = self->_audioSampleRates;
    self->_audioSampleRates = v12;

  }
  return v7;
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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v4);

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAudioCodecParameters bitRateSettings](self, "bitRateSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "bitrateSetting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 2, v8);

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMDAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "sampleRate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 3, v12);

  -[HMDAudioCodecParameters rtpPtime](self, "rtpPtime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 4, v13);

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
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioChannelCount = %@ "), v6, v9);

  -[HMDAudioCodecParameters bitRateSettings](self, "bitRateSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ bitRateSetting = %@ "), v6, v11);

  -[HMDAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioSampleRates = %@ "), v6, v13);

  -[HMDAudioCodecParameters rtpPtime](self, "rtpPtime");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtpPtime = %@ "), v6, v14);

}

- (HMDAudioCodecParameters)initWithCoder:(id)a3
{
  id v4;
  HMDAudioCodecParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *audioChannelCount;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *bitRateSettings;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *audioSampleRates;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSNumber *rtpPtime;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDAudioCodecParameters;
  v5 = -[HMDAudioCodecParameters init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kAudioCodecParameters__AudioChannels"));
    v9 = objc_claimAutoreleasedReturnValue();
    audioChannelCount = v5->_audioChannelCount;
    v5->_audioChannelCount = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kAudioCodecParameters__Bitrate"));
    v14 = objc_claimAutoreleasedReturnValue();
    bitRateSettings = v5->_bitRateSettings;
    v5->_bitRateSettings = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kAudioCodecParameters__SampleRate"));
    v19 = objc_claimAutoreleasedReturnValue();
    audioSampleRates = v5->_audioSampleRates;
    v5->_audioSampleRates = (NSArray *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("kAudioCodecParameters__RTPPtime"));
    v24 = objc_claimAutoreleasedReturnValue();
    rtpPtime = v5->_rtpPtime;
    v5->_rtpPtime = (NSNumber *)v24;

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
  -[HMDAudioCodecParameters audioChannelCount](self, "audioChannelCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAudioCodecParameters__AudioChannels"));

  -[HMDAudioCodecParameters bitRateSettings](self, "bitRateSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAudioCodecParameters__Bitrate"));

  -[HMDAudioCodecParameters audioSampleRates](self, "audioSampleRates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kAudioCodecParameters__SampleRate"));

  -[HMDAudioCodecParameters rtpPtime](self, "rtpPtime");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kAudioCodecParameters__RTPPtime"));

}

- (NSNumber)audioChannelCount
{
  return self->_audioChannelCount;
}

- (NSArray)bitRateSettings
{
  return self->_bitRateSettings;
}

- (NSArray)audioSampleRates
{
  return self->_audioSampleRates;
}

- (NSNumber)rtpPtime
{
  return self->_rtpPtime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpPtime, 0);
  objc_storeStrong((id *)&self->_audioSampleRates, 0);
  objc_storeStrong((id *)&self->_bitRateSettings, 0);
  objc_storeStrong((id *)&self->_audioChannelCount, 0);
}

HMDAudioSampleRate *__44__HMDAudioCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDAudioSampleRate *v3;

  v2 = a2;
  v3 = -[HMDAudioSampleRate initWithTLVData:]([HMDAudioSampleRate alloc], "initWithTLVData:", v2);

  return v3;
}

HMDBitRateSetting *__44__HMDAudioCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDBitRateSetting *v3;

  v2 = a2;
  v3 = -[HMDBitRateSetting initWithTLVData:]([HMDBitRateSetting alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
