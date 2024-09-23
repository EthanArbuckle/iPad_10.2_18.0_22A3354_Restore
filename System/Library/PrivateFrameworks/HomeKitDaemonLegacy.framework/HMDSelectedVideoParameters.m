@implementation HMDSelectedVideoParameters

- (HMDSelectedVideoParameters)initWithCodec:(id)a3 codecParameter:(id)a4 attribute:(id)a5 rtpParameter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDSelectedVideoParameters *v15;
  HMDSelectedVideoParameters *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSelectedVideoParameters;
  v15 = -[HMDSelectedVideoParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_codec, a3);
    objc_storeStrong((id *)&v16->_codecParameters, a4);
    objc_storeStrong((id *)&v16->_videoAttributes, a5);
    objc_storeStrong((id *)&v16->_rtpParameters, a6);
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
  void *v13;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDSelectedVideoParameters codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "codecType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v6);

  -[HMDSelectedVideoParameters codecParameters](self, "codecParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 2, v8);
  -[HMDSelectedVideoParameters videoAttributes](self, "videoAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlvData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v10);
  -[HMDSelectedVideoParameters rtpParameters](self, "rtpParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tlvData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 4, v12);
  objc_msgSend(v3, "serialize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v13;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDVideoCodec *v8;
  void *v9;
  HMDVideoCodec *v10;
  HMDVideoCodec *codec;
  HMDVideoCodecParameters *v12;
  void *v13;
  HMDVideoCodecParameters *v14;
  HMDVideoCodecParameters *codecParameters;
  HMDVideoAttributes *v16;
  void *v17;
  HMDVideoAttributes *v18;
  HMDVideoAttributes *videoAttributes;
  HMDSelectedRTPParameters *v20;
  void *v21;
  HMDSelectedRTPParameters *v22;
  HMDSelectedRTPParameters *rtpParameters;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kVideoParameters_Codec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 2, CFSTR("kVideoParameters_CodecParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 3, CFSTR("kVideoParameters_Attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 4, CFSTR("kVideoParameters_RTPParameter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v3;
  v33[1] = v4;
  v33[2] = v5;
  v33[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPTLVBase _parse:](self, "_parse:", v7))
  {
    v8 = [HMDVideoCodec alloc];
    objc_msgSend(v3, "field");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDVideoCodec initWithCodec:](v8, "initWithCodec:", objc_msgSend(v9, "unsignedIntegerValue"));
    codec = self->_codec;
    self->_codec = v10;

    v12 = [HMDVideoCodecParameters alloc];
    objc_msgSend(v4, "field");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HAPTLVBase initWithTLVData:](v12, "initWithTLVData:", v13);
    codecParameters = self->_codecParameters;
    self->_codecParameters = v14;

    v16 = [HMDVideoAttributes alloc];
    objc_msgSend(v5, "field");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPTLVBase initWithTLVData:](v16, "initWithTLVData:", v17);
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v18;

    v20 = [HMDSelectedRTPParameters alloc];
    objc_msgSend(v6, "field");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HAPTLVBase initWithTLVData:](v20, "initWithTLVData:", v21);
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v22;

    v31 = checkForParseResult(3, v24, v25, v26, v27, v28, v29, v30, (uint64_t)self->_codecParameters, (uint64_t)self->_videoAttributes);
  }
  else
  {
    v31 = 0;
  }

  return v31;
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

  -[HMDSelectedVideoParameters codec](self, "codec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videocodec = %@ "), v6, v9);

  -[HMDSelectedVideoParameters codecParameters](self, "codecParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptionWithIndent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ codecParameters = %@ "), v6, v11);

  -[HMDSelectedVideoParameters videoAttributes](self, "videoAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptionWithIndent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ attributes = %@ "), v6, v13);

  -[HMDSelectedVideoParameters rtpParameters](self, "rtpParameters");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionWithIndent:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtpParameters = %@ "), v6, v14);

}

- (HMDSelectedVideoParameters)initWithCoder:(id)a3
{
  id v4;
  HMDSelectedVideoParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDVideoCodec *codec;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDVideoCodecParameters *codecParameters;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDVideoAttributes *videoAttributes;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HMDSelectedRTPParameters *rtpParameters;
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDSelectedVideoParameters;
  v5 = -[HMDSelectedVideoParameters init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoParameters_Codec"));
    v9 = objc_claimAutoreleasedReturnValue();
    codec = v5->_codec;
    v5->_codec = (HMDVideoCodec *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoParameters_CodecParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    codecParameters = v5->_codecParameters;
    v5->_codecParameters = (HMDVideoCodecParameters *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kVideoParameters_Attributes"));
    v19 = objc_claimAutoreleasedReturnValue();
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (HMDVideoAttributes *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("kVideoParameters_RTPParameter"));
    v24 = objc_claimAutoreleasedReturnValue();
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDSelectedRTPParameters *)v24;

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
  -[HMDSelectedVideoParameters codec](self, "codec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoParameters_Codec"));

  -[HMDSelectedVideoParameters codecParameters](self, "codecParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoParameters_CodecParameters"));

  -[HMDSelectedVideoParameters videoAttributes](self, "videoAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoParameters_Attributes"));

  -[HMDSelectedVideoParameters rtpParameters](self, "rtpParameters");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kVideoParameters_RTPParameter"));

}

- (HMDVideoCodec)codec
{
  return self->_codec;
}

- (HMDVideoCodecParameters)codecParameters
{
  return self->_codecParameters;
}

- (HMDVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (HMDSelectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_videoAttributes, 0);
  objc_storeStrong((id *)&self->_codecParameters, 0);
  objc_storeStrong((id *)&self->_codec, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
