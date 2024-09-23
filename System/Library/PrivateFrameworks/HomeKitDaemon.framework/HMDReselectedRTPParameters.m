@implementation HMDReselectedRTPParameters

- (HMDReselectedRTPParameters)initWithMaximumBitrate:(id)a3 minimumBitrate:(id)a4 rtcpInterval:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDReselectedRTPParameters *v12;
  HMDReselectedRTPParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDReselectedRTPParameters;
  v12 = -[HMDReselectedRTPParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_maximumBitrate, a3);
    objc_storeStrong((id *)&v13->_minimumBitrate, a4);
    objc_storeStrong((id *)&v13->_rtcpInterval, a5);
  }

  return v13;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDReselectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue") / 0x3E8uLL;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 3, 2, v6);

  -[HMDReselectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 4, 4, v7);

  objc_msgSend(v3, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  NSNumber *v9;
  NSNumber *minimumBitrate;
  NSNumber *v11;
  NSNumber *rtcpInterval;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 3, CFSTR("kRTPParameters_MinimumVideoBandwidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 4, CFSTR("kRTPParameters_RTCPInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPTLVBase _parse:](self, "_parse:", v5);
  if (v6)
  {
    objc_msgSend(v3, "field");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1000 * v8);
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    minimumBitrate = self->_minimumBitrate;
    self->_minimumBitrate = v9;

    objc_msgSend(v4, "field");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    rtcpInterval = self->_rtcpInterval;
    self->_rtcpInterval = v11;

  }
  return v6;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDReselectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ minimumBitrate = %@ "), v6, v9);

  -[HMDReselectedRTPParameters maximumBitrate](self, "maximumBitrate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ maximumBitrate = %@ "), v6, v10);

  -[HMDReselectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ rtcpInterval = %@ "), v6, v11);

}

- (HMDReselectedRTPParameters)initWithCoder:(id)a3
{
  id v4;
  HMDReselectedRTPParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *minimumBitrate;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *maximumBitrate;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumber *rtcpInterval;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDReselectedRTPParameters;
  v5 = -[HMDReselectedRTPParameters init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kRTPParameters_MinimumVideoBandwidth"));
    v9 = objc_claimAutoreleasedReturnValue();
    minimumBitrate = v5->_minimumBitrate;
    v5->_minimumBitrate = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kRTPParameters_MaximumVideoBandwidth"));
    v14 = objc_claimAutoreleasedReturnValue();
    maximumBitrate = v5->_maximumBitrate;
    v5->_maximumBitrate = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kRTPParameters_RTCPInterval"));
    v19 = objc_claimAutoreleasedReturnValue();
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v19;

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
  -[HMDReselectedRTPParameters minimumBitrate](self, "minimumBitrate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRTPParameters_MinimumVideoBandwidth"));

  -[HMDReselectedRTPParameters maximumBitrate](self, "maximumBitrate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kRTPParameters_MaximumVideoBandwidth"));

  -[HMDReselectedRTPParameters rtcpInterval](self, "rtcpInterval");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kRTPParameters_RTCPInterval"));

}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
