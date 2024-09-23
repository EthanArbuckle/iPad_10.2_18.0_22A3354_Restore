@implementation HMDSupportedAudioStreamConfiguration

- (HMDSupportedAudioStreamConfiguration)initWithComfortNoise:(id)a3 CodecConfigurations:(id)a4
{
  id v7;
  id v8;
  HMDSupportedAudioStreamConfiguration *v9;
  HMDSupportedAudioStreamConfiguration *v10;
  uint64_t v11;
  NSDictionary *codecConfigurations;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSupportedAudioStreamConfiguration;
  v9 = -[HMDSupportedAudioStreamConfiguration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_supportsComfortNoise, a3);
    v11 = objc_msgSend(v8, "copy");
    codecConfigurations = v10->_codecConfigurations;
    v10->_codecConfigurations = (NSDictionary *)v11;

  }
  return v10;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *codecConfigurations;
  NSNumber *v20;
  NSNumber *supportsComfortNoise;
  void *v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 1, CFSTR("kSupportedAudioStreamConfiguration_AudioCodecConfigurations"), &__block_literal_global_379);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 2, CFSTR("kSupportedAudioStreamConfiguration_ComfortNoise"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v3;
  v30[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);
  v7 = v6;
  if (v6)
  {
    v23 = v5;
    v24 = v6;
    v8 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "field");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "codecGroup");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v18 = (NSDictionary *)objc_msgSend(v10, "copy");
    codecConfigurations = self->_codecConfigurations;
    self->_codecConfigurations = v18;

    objc_msgSend(v4, "field");
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    supportsComfortNoise = self->_supportsComfortNoise;
    self->_supportsComfortNoise = v20;

    v7 = v24;
    v5 = v23;
  }

  return v7;
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

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDSupportedAudioStreamConfiguration codecConfigurations](self, "codecConfigurations", 0);
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
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDSupportedAudioStreamConfiguration codecConfigurations](self, "codecConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ configurations = %@ "), v6, v11);

  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ comfortNoise = %@ "), v6, v12);

}

- (HMDSupportedAudioStreamConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDSupportedAudioStreamConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *codecConfigurations;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *supportsComfortNoise;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDSupportedAudioStreamConfiguration;
  v5 = -[HMDSupportedAudioStreamConfiguration init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSupportedAudioStreamConfiguration_AudioCodecConfigurations"));
    v9 = objc_claimAutoreleasedReturnValue();
    codecConfigurations = v5->_codecConfigurations;
    v5->_codecConfigurations = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSupportedAudioStreamConfiguration_ComfortNoise"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportsComfortNoise = v5->_supportsComfortNoise;
    v5->_supportsComfortNoise = (NSNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDSupportedAudioStreamConfiguration codecConfigurations](self, "codecConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSupportedAudioStreamConfiguration_AudioCodecConfigurations"));

  -[HMDSupportedAudioStreamConfiguration supportsComfortNoise](self, "supportsComfortNoise");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSupportedAudioStreamConfiguration_ComfortNoise"));

}

- (NSNumber)supportsComfortNoise
{
  return self->_supportsComfortNoise;
}

- (NSDictionary)codecConfigurations
{
  return self->_codecConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecConfigurations, 0);
  objc_storeStrong((id *)&self->_supportsComfortNoise, 0);
}

HMDAudioCodecConfiguration *__57__HMDSupportedAudioStreamConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDAudioCodecConfiguration *v3;

  v2 = a2;
  v3 = -[HAPTLVBase initWithTLVData:]([HMDAudioCodecConfiguration alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
