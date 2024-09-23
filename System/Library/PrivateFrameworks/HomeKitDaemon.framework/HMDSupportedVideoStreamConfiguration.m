@implementation HMDSupportedVideoStreamConfiguration

- (HMDSupportedVideoStreamConfiguration)initWithCodecConfigurations:(id)a3
{
  id v4;
  HMDSupportedVideoStreamConfiguration *v5;
  uint64_t v6;
  NSDictionary *codecConfigurations;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSupportedVideoStreamConfiguration;
  v5 = -[HMDSupportedVideoStreamConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *codecConfigurations;
  HMDSupportedVideoStreamConfiguration *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 1, CFSTR("kSupportedVideoStreamConfiguration_VideoCodecConfigurations"), &__block_literal_global_259_6546);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);
  if (v5)
  {
    v19 = self;
    v6 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v3, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "videoCodec");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v16 = objc_msgSend(v8, "copy");
    codecConfigurations = v19->_codecConfigurations;
    v19->_codecConfigurations = (NSDictionary *)v16;

  }
  return v5;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDSupportedVideoStreamConfiguration codecConfigurations](self, "codecConfigurations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "tlvData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addTLV:data:", 1, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDSupportedVideoStreamConfiguration codecConfigurations](self, "codecConfigurations");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ configurations = %@ "), v6, v10);

}

- (HMDSupportedVideoStreamConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDSupportedVideoStreamConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *codecConfigurations;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSupportedVideoStreamConfiguration;
  v5 = -[HMDSupportedVideoStreamConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSupportedVideoStreamConfiguration_VideoCodecConfigurations"));
    v9 = objc_claimAutoreleasedReturnValue();
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSupportedVideoStreamConfiguration codecConfigurations](self, "codecConfigurations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSupportedVideoStreamConfiguration_VideoCodecConfigurations"));

}

- (NSDictionary)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfigurations, 0);
}

HMDVideoCodecConfiguration *__57__HMDSupportedVideoStreamConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDVideoCodecConfiguration *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDVideoCodecConfiguration alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
