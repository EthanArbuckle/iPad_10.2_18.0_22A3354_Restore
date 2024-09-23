@implementation HMDCameraRecordingSupportedVideoConfiguration

- (HMDCameraRecordingSupportedVideoConfiguration)initWithCodecConfigurations:(id)a3
{
  id v5;
  HMDCameraRecordingSupportedVideoConfiguration *v6;
  HMDCameraRecordingSupportedVideoConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingSupportedVideoConfiguration;
  v6 = -[HMDCameraRecordingSupportedVideoConfiguration init](&v9, sel_init);
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

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 1, CFSTR("kSupportedVideoConfigurationCodecConfigurations"), &__block_literal_global_261);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSupportedVideoConfiguration codecConfigurations](self, "codecConfigurations");
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

  -[HMDCameraRecordingSupportedVideoConfiguration codecConfigurations](self, "codecConfigurations");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@codecConfigurations = %@ "), v6, v9);

}

- (HMDCameraRecordingSupportedVideoConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingSupportedVideoConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *codecConfigurations;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCameraRecordingSupportedVideoConfiguration;
  v5 = -[HMDCameraRecordingSupportedVideoConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSupportedVideoConfigurationCodecConfigurations"));
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
  -[HMDCameraRecordingSupportedVideoConfiguration codecConfigurations](self, "codecConfigurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSupportedVideoConfigurationCodecConfigurations"));

}

- (NSArray)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfigurations, 0);
}

HMDCameraRecordingVideoCodecConfiguration *__66__HMDCameraRecordingSupportedVideoConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingVideoCodecConfiguration *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDCameraRecordingVideoCodecConfiguration alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
