@implementation HMDSelectedAudioParameters

- (HMDSelectedAudioParameters)initWithCodecGroup:(id)a3 codecParameter:(id)a4 rtpParameter:(id)a5 comfortNoiseEnabled:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDSelectedAudioParameters *v15;
  HMDSelectedAudioParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSelectedAudioParameters;
  v15 = -[HMDSelectedAudioParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_codecGroup, a3);
    objc_storeStrong((id *)&v16->_codecParameters, a4);
    objc_storeStrong((id *)&v16->_rtpParameters, a5);
    objc_storeStrong((id *)&v16->_comfortNoiseEnabled, a6);
  }

  return v16;
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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDSelectedAudioParameters codecGroup](self, "codecGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "codec"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v6);

  -[HMDSelectedAudioParameters codecParameters](self, "codecParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
  -[HMDSelectedAudioParameters rtpParameters](self, "rtpParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlvData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v10);
  -[HMDSelectedAudioParameters comfortNoiseEnabled](self, "comfortNoiseEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 4, v11);

  objc_msgSend(v3, "serialize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v12;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAudioCodecGroup *v8;
  void *v9;
  HMDAudioCodecGroup *v10;
  HMDAudioCodecGroup *codecGroup;
  HMDAudioCodecParameters *v12;
  void *v13;
  HMDAudioCodecParameters *v14;
  HMDAudioCodecParameters *codecParameters;
  HMDSelectedRTPParameters *v16;
  void *v17;
  HMDSelectedRTPParameters *v18;
  HMDSelectedRTPParameters *rtpParameters;
  NSNumber *v20;
  NSNumber *comfortNoiseEnabled;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kAudioParameters_CodecGroup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 2, CFSTR("kAudioParameters_CodecParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 3, CFSTR("kAudioParameters_RTPParameter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 4, CFSTR("kAudioParameters_ComfortNoise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v3;
  v31[1] = v4;
  v31[2] = v5;
  v31[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPTLVBase _parse:](self, "_parse:", v7))
  {
    v8 = [HMDAudioCodecGroup alloc];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDAudioCodecGroup initWithAudioCodecGroup:](v8, "initWithAudioCodecGroup:", objc_msgSend(v9, "unsignedIntegerValue"));
    codecGroup = self->_codecGroup;
    self->_codecGroup = v10;

    v12 = [HMDAudioCodecParameters alloc];
    objc_msgSend(v4, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPTLVBase initWithTLVData:](v12, "initWithTLVData:", v13);
    codecParameters = self->_codecParameters;
    self->_codecParameters = v14;

    v16 = [HMDSelectedRTPParameters alloc];
    objc_msgSend(v5, "field");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPTLVBase initWithTLVData:](v16, "initWithTLVData:", v17);
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v18;

    objc_msgSend(v6, "field");
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    comfortNoiseEnabled = self->_comfortNoiseEnabled;
    self->_comfortNoiseEnabled = v20;

    v29 = checkForParseResult(2, v22, v23, v24, v25, v26, v27, v28, (uint64_t)self->_codecParameters, (uint64_t)self->_rtpParameters);
  }
  else
  {
    v29 = 0;
  }

  return v29;
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
  id v15;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDSelectedAudioParameters codecGroup](self, "codecGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ selected-audio-codec = %@ "), v6, v10);

  -[HMDSelectedAudioParameters codecParameters](self, "codecParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ codecParameters = %@ "), v6, v12);

  -[HMDSelectedAudioParameters rtpParameters](self, "rtpParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptionWithIndent:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtpParameters = %@ "), v6, v14);

  -[HMDSelectedAudioParameters comfortNoiseEnabled](self, "comfortNoiseEnabled");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ comfortNoiseEnabled = %@ "), v6, v15);

}

- (HMDSelectedAudioParameters)initWithCoder:(id)a3
{
  id v4;
  HMDSelectedAudioParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDAudioCodecGroup *codecGroup;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDAudioCodecParameters *codecParameters;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDSelectedRTPParameters *rtpParameters;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSNumber *comfortNoiseEnabled;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDSelectedAudioParameters;
  v5 = -[HMDSelectedAudioParameters init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v31[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kAudioParameters_CodecGroup"));
    v9 = objc_claimAutoreleasedReturnValue();
    codecGroup = v5->_codecGroup;
    v5->_codecGroup = (HMDAudioCodecGroup *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v30 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kAudioParameters_CodecParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDAudioCodecParameters *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kAudioParameters_RTPParameter"));
    v19 = objc_claimAutoreleasedReturnValue();
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDSelectedRTPParameters *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("kAudioParameters_ComfortNoise"));
    v24 = objc_claimAutoreleasedReturnValue();
    comfortNoiseEnabled = v5->_comfortNoiseEnabled;
    v5->_comfortNoiseEnabled = (NSNumber *)v24;

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
  -[HMDSelectedAudioParameters codecGroup](self, "codecGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAudioParameters_CodecGroup"));

  -[HMDSelectedAudioParameters codecParameters](self, "codecParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kAudioParameters_CodecParameters"));

  -[HMDSelectedAudioParameters rtpParameters](self, "rtpParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kAudioParameters_RTPParameter"));

  -[HMDSelectedAudioParameters comfortNoiseEnabled](self, "comfortNoiseEnabled");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kAudioParameters_ComfortNoise"));

}

- (HMDAudioCodecGroup)codecGroup
{
  return self->_codecGroup;
}

- (HMDAudioCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (HMDSelectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (NSNumber)comfortNoiseEnabled
{
  return self->_comfortNoiseEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoiseEnabled, 0);
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_codecGroup, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
