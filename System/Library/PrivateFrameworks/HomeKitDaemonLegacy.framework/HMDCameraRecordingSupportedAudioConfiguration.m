@implementation HMDCameraRecordingSupportedAudioConfiguration

- (HMDCameraRecordingSupportedAudioConfiguration)initWithCodecConfigurations:(id)a3
{
  id v5;
  HMDCameraRecordingSupportedAudioConfiguration *v6;
  HMDCameraRecordingSupportedAudioConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingSupportedAudioConfiguration;
  v6 = -[HMDCameraRecordingSupportedAudioConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_codecConfigurations, a3);

  return v7;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSArray *v6;
  NSArray *codecConfigurations;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 1, CFSTR("kSupportedAudioConfigurationCodecConfigurations"), &__block_literal_global_168);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);
  if (v5)
  {
    objc_msgSend(v3, "field");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    codecConfigurations = self->_codecConfigurations;
    self->_codecConfigurations = v6;

  }
  return v5;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSupportedAudioConfiguration codecConfigurations](self, "codecConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tlvData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 1, v6);
  objc_msgSend(v3, "serialize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingSupportedAudioConfiguration codecConfigurations](self, "codecConfigurations");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@codecConfigurations = %@ "), v6, v9);

}

- (HMDCameraRecordingSupportedAudioConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingSupportedAudioConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *codecConfigurations;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingSupportedAudioConfiguration;
  v5 = -[HMDCameraRecordingSupportedAudioConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSupportedAudioConfigurationCodecConfigurations"));
    v9 = objc_claimAutoreleasedReturnValue();
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCameraRecordingSupportedAudioConfiguration codecConfigurations](self, "codecConfigurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSupportedAudioConfigurationCodecConfigurations"));

}

- (NSArray)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfigurations, 0);
}

HMDCameraRecordingAudioCodecConfiguration *__66__HMDCameraRecordingSupportedAudioConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingAudioCodecConfiguration *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingAudioCodecConfiguration alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
