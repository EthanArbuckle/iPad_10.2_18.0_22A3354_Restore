@implementation HMDSetupEndPointRead

- (HMDSetupEndPointRead)initWithSessionIdentifier:(id)a3 address:(id)a4 videoSrtpParameters:(id)a5 audioSrtpParameters:(id)a6 responseStatus:(unint64_t)a7 videoSSRC:(id)a8 audioSSRC:(id)a9
{
  id v16;
  id v17;
  HMDSetupEndPointRead *v18;
  HMDSetupEndPointRead *v19;
  objc_super v21;

  v16 = a8;
  v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)HMDSetupEndPointRead;
  v18 = -[HMDSetupEndPointWrite initWithSessionIdentifier:address:videoSrtpParameters:audioSrtpParameters:](&v21, sel_initWithSessionIdentifier_address_videoSrtpParameters_audioSrtpParameters_, a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    v18->_responseStatus = a7;
    objc_storeStrong((id *)&v18->_videoSSRC, a8);
    objc_storeStrong((id *)&v19->_audioSSRC, a9);
  }

  return v19;
}

- (id)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMDSetupEndPointRead;
  -[HMDSetupEndPointWrite tlvData](&v12, sel_tlvData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSetupEndPointRead responseStatus](self, "responseStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTLV:number:", 2, v6);

  -[HMDSetupEndPointRead videoSSRC](self, "videoSSRC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTLV:length:number:", 6, 4, v7);

  -[HMDSetupEndPointRead audioSSRC](self, "audioSSRC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTLV:length:number:", 7, 4, v8);

  objc_msgSend(v5, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v9);

  v10 = (void *)objc_msgSend(v4, "copy");
  return v10;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC38], "wrappertlv:name:", 1, CFSTR("kSetupEndPoint__SessionIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 2, CFSTR("kSetupEndPointRead__Status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);

  if (v6)
  {
    objc_msgSend(v4, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_responseStatus = objc_msgSend(v7, "unsignedIntegerValue");

    if (self->_responseStatus)
      v8 = -[HMDSetupEndPointRead _parseFromTLVDataOnFailure](self, "_parseFromTLVDataOnFailure");
    else
      v8 = -[HMDSetupEndPointRead _parseFromTLVDataOnSuccess](self, "_parseFromTLVDataOnSuccess");
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_parseFromTLVDataOnSuccess
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSNumber *v7;
  NSNumber *videoSSRC;
  NSNumber *v9;
  NSNumber *audioSSRC;
  BOOL v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 6, CFSTR("kSetupEndPointRead__VideoSSRC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 7, CFSTR("kSetupEndPointRead__AudioSSRC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);

  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)HMDSetupEndPointRead,
        -[HMDSetupEndPointWrite _parseFromTLVDataOnSuccess](&v13, sel__parseFromTLVDataOnSuccess)))
  {
    objc_msgSend(v3, "field");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    videoSSRC = self->_videoSSRC;
    self->_videoSSRC = v7;

    objc_msgSend(v4, "field");
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    audioSSRC = self->_audioSSRC;
    self->_audioSSRC = v9;

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_parseFromTLVDataOnFailure
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSetupEndPointRead;
  return -[HMDSetupEndPointWrite _parseFromTLVDataOnFailure](&v3, sel__parseFromTLVDataOnFailure);
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDSetupEndPointRead;
  v6 = a4;
  v7 = a3;
  -[HMDSetupEndPointWrite description:indent:](&v11, sel_description_indent_, v7, v6);
  -[HMDSetupEndPointRead videoSSRC](self, "videoSSRC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoSSRC = %@ "), v6, v8, v11.receiver, v11.super_class);

  -[HMDSetupEndPointRead audioSSRC](self, "audioSSRC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioSSRC = %@ "), v6, v9);

  HMDStreamControlPointResponseStatusAsString(-[HMDSetupEndPointRead responseStatus](self, "responseStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ responseStatus = %@ "), v6, v10);

}

- (HMDSetupEndPointRead)initWithCoder:(id)a3
{
  id v4;
  HMDSetupEndPointRead *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *videoSSRC;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *audioSSRC;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDSetupEndPointRead;
  v5 = -[HMDSetupEndPointWrite initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_responseStatus = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kSetupEndPointRead__Status"));
    v6 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSetupEndPointRead__VideoSSRC"));
    v9 = objc_claimAutoreleasedReturnValue();
    videoSSRC = v5->_videoSSRC;
    v5->_videoSSRC = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSetupEndPointRead__AudioSSRC"));
    v14 = objc_claimAutoreleasedReturnValue();
    audioSSRC = v5->_audioSSRC;
    v5->_audioSSRC = (NSNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDSetupEndPointRead;
  v4 = a3;
  -[HMDSetupEndPointWrite encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDSetupEndPointRead responseStatus](self, "responseStatus", v7.receiver, v7.super_class), CFSTR("kSetupEndPointRead__Status"));
  -[HMDSetupEndPointRead videoSSRC](self, "videoSSRC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSetupEndPointRead__VideoSSRC"));

  -[HMDSetupEndPointRead audioSSRC](self, "audioSSRC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSetupEndPointRead__AudioSSRC"));

}

- (unint64_t)responseStatus
{
  return self->_responseStatus;
}

- (NSNumber)videoSSRC
{
  return self->_videoSSRC;
}

- (NSNumber)audioSSRC
{
  return self->_audioSSRC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSSRC, 0);
  objc_storeStrong((id *)&self->_videoSSRC, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
