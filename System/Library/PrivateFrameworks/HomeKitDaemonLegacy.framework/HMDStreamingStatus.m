@implementation HMDStreamingStatus

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kStreamingStatus_Status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);
  if (v5)
  {
    objc_msgSend(v3, "field");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_streamingStatus = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDStreamingStatus streamingStatus](self, "streamingStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v4);

  objc_msgSend(v3, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  HMDStreamingStatusTypeAsString(-[HMDStreamingStatus streamingStatus](self, "streamingStatus"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ responseStatus = %@ "), v6, v8);

}

- (HMDStreamingStatus)initWithCoder:(id)a3
{
  id v4;
  HMDStreamingStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDStreamingStatus;
  v5 = -[HMDStreamingStatus init](&v7, sel_init);
  if (v5)
    v5->_streamingStatus = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kStreamingStatus_Status"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[HMDStreamingStatus streamingStatus](self, "streamingStatus"), CFSTR("kStreamingStatus_Status"));

}

- (unint64_t)streamingStatus
{
  return self->_streamingStatus;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
