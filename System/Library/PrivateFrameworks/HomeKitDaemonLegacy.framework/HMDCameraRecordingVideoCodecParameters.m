@implementation HMDCameraRecordingVideoCodecParameters

- (HMDCameraRecordingVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 bitRate:(id)a5 iFrameInterval:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDCameraRecordingVideoCodecParameters *v15;
  HMDCameraRecordingVideoCodecParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingVideoCodecParameters;
  v15 = -[HMDCameraRecordingVideoCodecParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_profiles, a3);
    objc_storeStrong((id *)&v16->_levels, a4);
    objc_storeStrong((id *)&v16->_bitRate, a5);
    objc_storeStrong((id *)&v16->_iFrameInterval, a6);
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
  NSArray *profiles;
  NSArray *v12;
  NSArray *levels;
  NSNumber *v14;
  NSNumber *bitRate;
  NSNumber *v16;
  NSNumber *iFrameInterval;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 1, CFSTR("kVideoCodecParametersProfileID"), &__block_literal_global_132081);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 2, CFSTR("kVideoCodecParametersLevel"), &__block_literal_global_139_132082);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 3, CFSTR("kVideoCodecParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 4, CFSTR("kVideoCodecParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPTLVBase _parseMandatory:optional:](self, "_parseMandatory:optional:", v7, v8);
  if (v9)
  {
    objc_msgSend(v3, "field");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    profiles = self->_profiles;
    self->_profiles = v10;

    objc_msgSend(v4, "field");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    levels = self->_levels;
    self->_levels = v12;

  }
  objc_msgSend(v5, "field");
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  bitRate = self->_bitRate;
  self->_bitRate = v14;

  objc_msgSend(v6, "field");
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  iFrameInterval = self->_iFrameInterval;
  self->_iFrameInterval = v16;

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
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingVideoCodecParameters profiles](self, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "h264Profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 1, v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingVideoCodecParameters levels](self, "levels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "h264Level"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 1, v11);

  -[HMDCameraRecordingVideoCodecParameters bitRate](self, "bitRate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 4, v12);

  -[HMDCameraRecordingVideoCodecParameters iFrameInterval](self, "iFrameInterval");
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
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@tlvDatablob = %@ "), v6, v8);

  -[HMDCameraRecordingVideoCodecParameters profiles](self, "profiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentationByLevels:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@h264Profile = %@ "), v6, v11);

  -[HMDCameraRecordingVideoCodecParameters levels](self, "levels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indentationByLevels:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HAPTLVCreateParseArrayToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@levels = %@"), v6, v14);

  -[HMDCameraRecordingVideoCodecParameters bitRate](self, "bitRate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@bitRate = %@"), v6, v15);

  -[HMDCameraRecordingVideoCodecParameters iFrameInterval](self, "iFrameInterval");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@iFrameInterval = %@"), v6, v16);

}

- (HMDCameraRecordingVideoCodecParameters)initWithCoder:(id)a3
{
  id v4;
  HMDCameraRecordingVideoCodecParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *profiles;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *levels;
  uint64_t v16;
  NSNumber *bitRate;
  uint64_t v18;
  NSNumber *iFrameInterval;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraRecordingVideoCodecParameters;
  v5 = -[HMDCameraRecordingVideoCodecParameters init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoCodecParametersProfileID"));
    v9 = objc_claimAutoreleasedReturnValue();
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoCodecParametersLevel"));
    v14 = objc_claimAutoreleasedReturnValue();
    levels = v5->_levels;
    v5->_levels = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoCodecParameters"));
    v16 = objc_claimAutoreleasedReturnValue();
    bitRate = v5->_bitRate;
    v5->_bitRate = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kVideoCodecParameters"));
    v18 = objc_claimAutoreleasedReturnValue();
    iFrameInterval = v5->_iFrameInterval;
    v5->_iFrameInterval = (NSNumber *)v18;

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
  -[HMDCameraRecordingVideoCodecParameters profiles](self, "profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoCodecParametersProfileID"));

  -[HMDCameraRecordingVideoCodecParameters levels](self, "levels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoCodecParametersLevel"));

  -[HMDCameraRecordingVideoCodecParameters bitRate](self, "bitRate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoCodecParameters"));

  -[HMDCameraRecordingVideoCodecParameters iFrameInterval](self, "iFrameInterval");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kVideoCodecParameters"));

}

- (NSArray)profiles
{
  return self->_profiles;
}

- (NSArray)levels
{
  return self->_levels;
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (NSNumber)iFrameInterval
{
  return self->_iFrameInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iFrameInterval, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

HMDCameraRecordingH264Level *__59__HMDCameraRecordingVideoCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingH264Level *v3;

  v2 = a2;
  v3 = -[HMDCameraRecordingH264Level initWithTLVData:]([HMDCameraRecordingH264Level alloc], "initWithTLVData:", v2);

  return v3;
}

HMDCameraRecordingH264Profile *__59__HMDCameraRecordingVideoCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDCameraRecordingH264Profile *v3;

  v2 = a2;
  v3 = -[HMDCameraRecordingH264Profile initWithTLVData:]([HMDCameraRecordingH264Profile alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
