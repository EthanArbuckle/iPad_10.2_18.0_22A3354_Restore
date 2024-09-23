@implementation HMDEndPointAddress

- (HMDEndPointAddress)initWithIPAddress:(id)a3 isIPv6Address:(BOOL)a4 videoRTPPort:(id)a5 audioRTPPort:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDEndPointAddress *v14;
  HMDEndPointAddress *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDEndPointAddress;
  v14 = -[HMDEndPointAddress init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_ipAddress, a3);
    v15->_isIPv6Address = a4;
    objc_storeStrong((id *)&v15->_videoRTPPort, a5);
    objc_storeStrong((id *)&v15->_audioRTPPort, a6);
  }

  return v15;
}

- (BOOL)compatibleWithRemoteEndPoint:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  LODWORD(self) = -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address");
  if ((_DWORD)self == objc_msgSend(v4, "isIPv6Address")
    && (objc_msgSend(v4, "audioRTPPort"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "unsignedIntegerValue"),
        v5,
        v6))
  {
    objc_msgSend(v4, "videoRTPPort");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v4);

  -[HMDEndPointAddress ipAddress](self, "ipAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:string:", 2, v5);

  -[HMDEndPointAddress videoRTPPort](self, "videoRTPPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 2, v6);

  -[HMDEndPointAddress audioRTPPort](self, "audioRTPPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 4, 2, v7);

  objc_msgSend(v3, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSString *v9;
  NSString *ipAddress;
  void *v11;
  NSNumber *v12;
  NSNumber *videoRTPPort;
  NSNumber *v14;
  NSNumber *audioRTPPort;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D165C8], "wrappertlv:name:", 2, CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddressVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 3, CFSTR("kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 4, CFSTR("kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = v4;
  v17[2] = v5;
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPTLVBase _parse:](self, "_parse:", v7);
  if (v8)
  {
    objc_msgSend(v3, "field");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    ipAddress = self->_ipAddress;
    self->_ipAddress = v9;

    objc_msgSend(v4, "field");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isIPv6Address = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v5, "field");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    videoRTPPort = self->_videoRTPPort;
    self->_videoRTPPort = v12;

    objc_msgSend(v6, "field");
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    audioRTPPort = self->_audioRTPPort;
    self->_audioRTPPort = v14;

  }
  return v8;
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

  -[HMDEndPointAddress ipAddress](self, "ipAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ ipAddress = %@ "), v6, v9);

  -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ isIPv6Address = %@ "), v6, v10);

  -[HMDEndPointAddress videoRTPPort](self, "videoRTPPort");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ videoRTPPort = %@ "), v6, v11);

  -[HMDEndPointAddress audioRTPPort](self, "audioRTPPort");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ audioRTPPort = %@ "), v6, v12);

}

- (HMDEndPointAddress)initWithCoder:(id)a3
{
  id v4;
  HMDEndPointAddress *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *ipAddress;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *videoRTPPort;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumber *audioRTPPort;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDEndPointAddress;
  v5 = -[HMDEndPointAddress init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddress"));
    v9 = objc_claimAutoreleasedReturnValue();
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v9;

    v5->_isIPv6Address = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddressVersion"));
    v11 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoRTPPort = v5->_videoRTPPort;
    v5->_videoRTPPort = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"));
    v19 = objc_claimAutoreleasedReturnValue();
    audioRTPPort = v5->_audioRTPPort;
    v5->_audioRTPPort = (NSNumber *)v19;

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
  -[HMDEndPointAddress ipAddress](self, "ipAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddress"));

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDEndPointAddress isIPv6Address](self, "isIPv6Address"), CFSTR("kStreamManagementControlPoint__ControllerAddress__IPAddressVersion"));
  -[HMDEndPointAddress videoRTPPort](self, "videoRTPPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kStreamManagementControlPoint__ControllerAddress__VideoRTPPort"));

  -[HMDEndPointAddress audioRTPPort](self, "audioRTPPort");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kStreamManagementControlPoint__ControllerAddress__AudioRTPPort"));

}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (BOOL)isIPv6Address
{
  return self->_isIPv6Address;
}

- (NSNumber)videoRTPPort
{
  return self->_videoRTPPort;
}

- (NSNumber)audioRTPPort
{
  return self->_audioRTPPort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRTPPort, 0);
  objc_storeStrong((id *)&self->_videoRTPPort, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
