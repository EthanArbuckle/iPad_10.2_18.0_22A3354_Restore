@implementation HMDReselectedVideoParameters

- (HMDReselectedVideoParameters)initWithAttribute:(id)a3 rtpParameter:(id)a4
{
  id v7;
  id v8;
  HMDReselectedVideoParameters *v9;
  HMDReselectedVideoParameters *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDReselectedVideoParameters;
  v9 = -[HMDReselectedVideoParameters init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoAttributes, a3);
    objc_storeStrong((id *)&v10->_rtpParameters, a4);
  }

  return v10;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDReselectedVideoParameters videoAttributes](self, "videoAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tlvData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v5);
  -[HMDReselectedVideoParameters rtpParameters](self, "rtpParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlvData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 4, v7);
  objc_msgSend(v3, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  HMDVideoAttributes *v6;
  void *v7;
  HMDVideoAttributes *v8;
  HMDVideoAttributes *videoAttributes;
  HMDReselectedRTPParameters *v10;
  void *v11;
  HMDReselectedRTPParameters *v12;
  HMDReselectedRTPParameters *rtpParameters;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 3, CFSTR("kVideoParameters_Attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 4, CFSTR("kVideoParameters_RTPParameter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HAPTLVBase _parse:](self, "_parse:", v5))
  {
    v6 = [HMDVideoAttributes alloc];
    objc_msgSend(v3, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HAPTLVBase initWithTLVData:](v6, "initWithTLVData:", v7);
    videoAttributes = self->_videoAttributes;
    self->_videoAttributes = v8;

    v10 = [HMDReselectedRTPParameters alloc];
    objc_msgSend(v4, "field");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HAPTLVBase initWithTLVData:](v10, "initWithTLVData:", v11);
    rtpParameters = self->_rtpParameters;
    self->_rtpParameters = v12;

    v21 = checkForParseResult(2, v14, v15, v16, v17, v18, v19, v20, (uint64_t)self->_videoAttributes, (uint64_t)self->_rtpParameters);
  }
  else
  {
    v21 = 0;
  }

  return v21;
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

  -[HMDReselectedVideoParameters videoAttributes](self, "videoAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ attributes = %@ "), v6, v10);

  -[HMDReselectedVideoParameters rtpParameters](self, "rtpParameters");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptionWithIndent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtpParameters = %@ "), v6, v11);

}

- (HMDReselectedVideoParameters)initWithCoder:(id)a3
{
  id v4;
  HMDReselectedVideoParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDVideoAttributes *videoAttributes;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDReselectedRTPParameters *rtpParameters;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDReselectedVideoParameters;
  v5 = -[HMDReselectedVideoParameters init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoParameters_Attributes"));
    v9 = objc_claimAutoreleasedReturnValue();
    videoAttributes = v5->_videoAttributes;
    v5->_videoAttributes = (HMDVideoAttributes *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoParameters_RTPParameter"));
    v14 = objc_claimAutoreleasedReturnValue();
    rtpParameters = v5->_rtpParameters;
    v5->_rtpParameters = (HMDReselectedRTPParameters *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDReselectedVideoParameters videoAttributes](self, "videoAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoParameters_Attributes"));

  -[HMDReselectedVideoParameters rtpParameters](self, "rtpParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoParameters_RTPParameter"));

}

- (HMDVideoAttributes)videoAttributes
{
  return self->_videoAttributes;
}

- (HMDReselectedRTPParameters)rtpParameters
{
  return self->_rtpParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpParameters, 0);
  objc_storeStrong((id *)&self->_videoAttributes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
