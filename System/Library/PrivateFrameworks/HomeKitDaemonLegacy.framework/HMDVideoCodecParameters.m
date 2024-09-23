@implementation HMDVideoCodecParameters

- (HMDVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 packetizationModes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDVideoCodecParameters *v12;
  HMDVideoCodecParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVideoCodecParameters;
  v12 = -[HMDVideoCodecParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_h264Profiles, a3);
    objc_storeStrong((id *)&v13->_levels, a4);
    objc_storeStrong((id *)&v13->_packetizationModes, a5);
  }

  return v13;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSArray *v8;
  NSArray *h264Profiles;
  NSArray *v10;
  NSArray *levels;
  NSArray *v12;
  NSArray *packetizationModes;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 1, CFSTR("kVideoCodecParameters__ProfileID"), &__block_literal_global_5051);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 2, CFSTR("kVideoCodecParameters__Level"), &__block_literal_global_95);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16400], "wrappertlv:name:objectCreator:", 3, CFSTR("kVideoCodecParameters__PacketizationMode"), &__block_literal_global_97);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = v4;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v3, "field");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    h264Profiles = self->_h264Profiles;
    self->_h264Profiles = v8;

    objc_msgSend(v4, "field");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    levels = self->_levels;
    self->_levels = v10;

    objc_msgSend(v5, "field");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    packetizationModes = self->_packetizationModes;
    self->_packetizationModes = v12;

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
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDVideoCodecParameters h264Profiles](self, "h264Profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "h264Profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDVideoCodecParameters levels](self, "levels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "h264Level"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 2, v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDVideoCodecParameters packetizationModes](self, "packetizationModes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "packetizationMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 3, v15);

  objc_msgSend(v3, "serialize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v16;
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

  -[HMDVideoCodecParameters h264Profiles](self, "h264Profiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ h264Profile = %@ "), v6, v10);

  -[HMDVideoCodecParameters levels](self, "levels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  arrayToString(v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ levels = %@"), v6, v12);

  -[HMDVideoCodecParameters packetizationModes](self, "packetizationModes");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  arrayToString(v14, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ packetizationModes = %@"), v6, v13);

}

- (HMDVideoCodecParameters)initWithCoder:(id)a3
{
  id v4;
  HMDVideoCodecParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *h264Profiles;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *levels;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *packetizationModes;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDVideoCodecParameters;
  v5 = -[HMDVideoCodecParameters init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoCodecParameters__ProfileID"));
    v9 = objc_claimAutoreleasedReturnValue();
    h264Profiles = v5->_h264Profiles;
    v5->_h264Profiles = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoCodecParameters__Level"));
    v14 = objc_claimAutoreleasedReturnValue();
    levels = v5->_levels;
    v5->_levels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kVideoCodecParameters__PacketizationMode"));
    v19 = objc_claimAutoreleasedReturnValue();
    packetizationModes = v5->_packetizationModes;
    v5->_packetizationModes = (NSArray *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDVideoCodecParameters h264Profiles](self, "h264Profiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoCodecParameters__ProfileID"));

  -[HMDVideoCodecParameters levels](self, "levels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoCodecParameters__Level"));

  -[HMDVideoCodecParameters packetizationModes](self, "packetizationModes");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoCodecParameters__PacketizationMode"));

}

- (NSArray)h264Profiles
{
  return self->_h264Profiles;
}

- (NSArray)levels
{
  return self->_levels;
}

- (NSArray)packetizationModes
{
  return self->_packetizationModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetizationModes, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_h264Profiles, 0);
}

HMDPacketizationMode *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HMDPacketizationMode *v3;

  v2 = a2;
  v3 = -[HMDPacketizationMode initWithTLVData:]([HMDPacketizationMode alloc], "initWithTLVData:", v2);

  return v3;
}

HMDH264Level *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HMDH264Level *v3;

  v2 = a2;
  v3 = -[HMDH264Level initWithTLVData:]([HMDH264Level alloc], "initWithTLVData:", v2);

  return v3;
}

HMDH264Profile *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDH264Profile *v3;

  v2 = a2;
  v3 = -[HMDH264Profile initWithTLVData:]([HMDH264Profile alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
