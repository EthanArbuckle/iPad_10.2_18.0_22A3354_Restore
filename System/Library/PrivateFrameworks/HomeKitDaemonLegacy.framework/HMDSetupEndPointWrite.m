@implementation HMDSetupEndPointWrite

- (HMDSetupEndPointWrite)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDSetupEndPointWrite *v15;
  HMDSetupEndPointWrite *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSetupEndPointWrite;
  v15 = -[HMDSetupEndPointWrite init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_address, a4);
    objc_storeStrong((id *)&v16->_videoSrtpParameters, a5);
    objc_storeStrong((id *)&v16->_audioSrtpParameters, a6);
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

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSetupEndPointWrite sessionID](self, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:uuid:", 1, v4);

  -[HMDSetupEndPointWrite address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tlvData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 3, v6);
  -[HMDSetupEndPointWrite videoSrtpParameters](self, "videoSrtpParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tlvData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 4, v8);
  -[HMDSetupEndPointWrite audioSrtpParameters](self, "audioSrtpParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tlvData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addTLV:data:", 5, v10);
  objc_msgSend(v3, "serialize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v11;
}

- (BOOL)_parseFromTLVDataImpl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSUUID *v9;
  NSUUID *sessionID;
  HMDEndPointAddress *v11;
  void *v12;
  HMDEndPointAddress *v13;
  HMDEndPointAddress *address;
  HMDSRTPParameters *v15;
  void *v16;
  HMDSRTPParameters *v17;
  HMDSRTPParameters *videoSrtpParameters;
  HMDSRTPParameters *v19;
  void *v20;
  HMDSRTPParameters *v21;
  HMDSRTPParameters *audioSrtpParameters;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16620], "wrappertlv:name:", 1, CFSTR("kSetupEndPoint__SessionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 3, CFSTR("kSetupEndPoint__ControllerAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 4, CFSTR("kSetupEndPoint__SRTPVideoParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D164D0], "wrappertlv:name:", 5, CFSTR("kSetupEndPoint__SRTPAudioParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v3;
  v32[1] = v4;
  v32[2] = v5;
  v32[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPTLVBase _parse:](self, "_parse:", v7);

  if (v8)
  {
    objc_msgSend(v3, "field");
    v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    sessionID = self->_sessionID;
    self->_sessionID = v9;

    v11 = [HMDEndPointAddress alloc];
    objc_msgSend(v4, "field");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HAPTLVBase initWithTLVData:](v11, "initWithTLVData:", v12);
    address = self->_address;
    self->_address = v13;

    v15 = [HMDSRTPParameters alloc];
    objc_msgSend(v5, "field");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HAPTLVBase initWithTLVData:](v15, "initWithTLVData:", v16);
    videoSrtpParameters = self->_videoSrtpParameters;
    self->_videoSrtpParameters = v17;

    v19 = [HMDSRTPParameters alloc];
    objc_msgSend(v6, "field");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HAPTLVBase initWithTLVData:](v19, "initWithTLVData:", v20);
    audioSrtpParameters = self->_audioSrtpParameters;
    self->_audioSrtpParameters = v21;

    v30 = checkForParseResult(3, v23, v24, v25, v26, v27, v28, v29, (uint64_t)self->_address, (uint64_t)self->_videoSrtpParameters);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)_parseFromTLVDataOnFailure
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSUUID *v6;
  NSUUID *sessionID;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16620], "wrappertlv:name:", 1, CFSTR("kSetupEndPoint__SessionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);

  if (v5)
  {
    objc_msgSend(v3, "field");
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    sessionID = self->_sessionID;
    self->_sessionID = v6;

  }
  return v5;
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
  -[HMDSetupEndPointWrite sessionID](self, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ sessionID = %@ "), v6, v8);

  -[HMDSetupEndPointWrite address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionWithIndent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ deviceAddress = %@ "), v6, v10);

  -[HMDSetupEndPointWrite videoSrtpParameters](self, "videoSrtpParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoSRTPParameters = %@ "), v6, v12);

  -[HMDSetupEndPointWrite audioSrtpParameters](self, "audioSrtpParameters");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptionWithIndent:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioSRTPParameters = %@ "), v6, v13);

}

- (HMDSetupEndPointWrite)initWithCoder:(id)a3
{
  id v4;
  HMDSetupEndPointWrite *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUUID *sessionID;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDSRTPParameters *videoSrtpParameters;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HMDSRTPParameters *audioSrtpParameters;
  HMDEndPointAddress *v21;
  HMDEndPointAddress *address;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDSetupEndPointWrite;
  v5 = -[HMDSetupEndPointWrite init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSetupEndPoint__SessionIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSUUID *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSetupEndPoint__SRTPVideoParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoSrtpParameters = v5->_videoSrtpParameters;
    v5->_videoSrtpParameters = (HMDSRTPParameters *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kSetupEndPoint__SRTPAudioParameters"));
    v19 = objc_claimAutoreleasedReturnValue();
    audioSrtpParameters = v5->_audioSrtpParameters;
    v5->_audioSrtpParameters = (HMDSRTPParameters *)v19;

    v21 = -[HMDEndPointAddress initWithIPAddress:isIPv6Address:videoRTPPort:audioRTPPort:]([HMDEndPointAddress alloc], "initWithIPAddress:isIPv6Address:videoRTPPort:audioRTPPort:", &stru_1E89C3E38, 0, &unk_1E8B32640, &unk_1E8B32640);
    address = v5->_address;
    v5->_address = v21;

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
  -[HMDSetupEndPointWrite sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSetupEndPoint__SessionIdentifier"));

  -[HMDSetupEndPointWrite videoSrtpParameters](self, "videoSrtpParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSetupEndPoint__SRTPVideoParameters"));

  -[HMDSetupEndPointWrite audioSrtpParameters](self, "audioSrtpParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSetupEndPoint__SRTPAudioParameters"));

}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (HMDEndPointAddress)address
{
  return self->_address;
}

- (HMDSRTPParameters)videoSrtpParameters
{
  return self->_videoSrtpParameters;
}

- (HMDSRTPParameters)audioSrtpParameters
{
  return self->_audioSrtpParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSrtpParameters, 0);
  objc_storeStrong((id *)&self->_videoSrtpParameters, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
