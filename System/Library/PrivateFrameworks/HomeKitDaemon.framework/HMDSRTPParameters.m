@implementation HMDSRTPParameters

- (HMDSRTPParameters)initWithCryptoSuite:(id)a3 masterKey:(id)a4 masterSalt:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSRTPParameters *v12;
  HMDSRTPParameters *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSRTPParameters;
  v12 = -[HMDSRTPParameters init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_srtpCryptoSuite, a3);
    objc_storeStrong((id *)&v13->_srtpMasterKey, a4);
    objc_storeStrong((id *)&v13->_srtpMasterSalt, a5);
  }

  return v13;
}

- (BOOL)compatibleWithRemoteEndPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[HMDSRTPParameters srtpCryptoSuite](self, "srtpCryptoSuite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srtpCryptoSuite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if (!v7)
    goto LABEL_4;
  -[HMDSRTPParameters srtpMasterKey](self, "srtpMasterKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  objc_msgSend(v4, "srtpMasterKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v9 == v11)
  {
    -[HMDSRTPParameters srtpMasterSalt](self, "srtpMasterSalt");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");
    objc_msgSend(v4, "srtpMasterSalt");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13 == objc_msgSend(v14, "length");

  }
  else
  {
LABEL_4:
    v15 = 0;
  }

  return v15;
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

  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSRTPParameters srtpMasterKey](self, "srtpMasterKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:data:", 2, v4);

  -[HMDSRTPParameters srtpMasterSalt](self, "srtpMasterSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:data:", 3, v5);

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMDSRTPParameters srtpCryptoSuite](self, "srtpCryptoSuite");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "srtpCryptoSuite"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 1, v8);

  objc_msgSend(v3, "serialize");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v9;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  HMDSRTPCryptoSuite *v10;
  HMDSRTPCryptoSuite *srtpCryptoSuite;
  NSData *v12;
  NSData *srtpMasterKey;
  NSData *v14;
  NSData *v15;
  NSData *v16;
  NSData *srtpMasterSalt;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 2, CFSTR("kSRTPParameters_SRTPMasterKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BAC8], "wrappertlv:name:", 3, CFSTR("kSRTPParameters_SRTPMasterSalt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1BB90], "wrappertlv:name:", 1, CFSTR("kSRTPParameters_SRTPCryptoSuite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = v4;
  v19[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v5, "field");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    v10 = -[HMDSRTPCryptoSuite initWithCryptoSuite:]([HMDSRTPCryptoSuite alloc], "initWithCryptoSuite:", v9);
    srtpCryptoSuite = self->_srtpCryptoSuite;
    self->_srtpCryptoSuite = v10;

    if (v9 < 2)
    {
      objc_msgSend(v3, "field");
      v12 = (NSData *)objc_claimAutoreleasedReturnValue();
      srtpMasterKey = self->_srtpMasterKey;
      self->_srtpMasterKey = v12;

      objc_msgSend(v4, "field");
      v14 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      srtpMasterSalt = self->_srtpMasterSalt;
      self->_srtpMasterSalt = v14;

      goto LABEL_7;
    }
    if (v9 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      v16 = self->_srtpMasterKey;
      self->_srtpMasterKey = v15;

      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v14 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
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

  -[HMDSRTPParameters srtpMasterKey](self, "srtpMasterKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ srtpMasterKey = %@ "), v6, v9);

  -[HMDSRTPParameters srtpMasterSalt](self, "srtpMasterSalt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ srtpMasterSalt = %@ "), v6, v10);

  -[HMDSRTPParameters srtpCryptoSuite](self, "srtpCryptoSuite");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ srtpCryptoSuite = %@ "), v6, v11);

}

- (HMDSRTPParameters)initWithCoder:(id)a3
{
  id v4;
  HMDSRTPParameters *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDSRTPCryptoSuite *srtpCryptoSuite;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSData *srtpMasterKey;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData *srtpMasterSalt;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDSRTPParameters;
  v5 = -[HMDSRTPParameters init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v25[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSRTPParameters_SRTPCryptoSuite"));
    v9 = objc_claimAutoreleasedReturnValue();
    srtpCryptoSuite = v5->_srtpCryptoSuite;
    v5->_srtpCryptoSuite = (HMDSRTPCryptoSuite *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kSRTPParameters_SRTPMasterKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    srtpMasterKey = v5->_srtpMasterKey;
    v5->_srtpMasterKey = (NSData *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("kSRTPParameters_SRTPMasterSalt"));
    v19 = objc_claimAutoreleasedReturnValue();
    srtpMasterSalt = v5->_srtpMasterSalt;
    v5->_srtpMasterSalt = (NSData *)v19;

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
  -[HMDSRTPParameters srtpCryptoSuite](self, "srtpCryptoSuite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSRTPParameters_SRTPCryptoSuite"));

  -[HMDSRTPParameters srtpMasterKey](self, "srtpMasterKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSRTPParameters_SRTPMasterKey"));

  -[HMDSRTPParameters srtpMasterSalt](self, "srtpMasterSalt");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSRTPParameters_SRTPMasterSalt"));

}

- (HMDSRTPCryptoSuite)srtpCryptoSuite
{
  return self->_srtpCryptoSuite;
}

- (NSData)srtpMasterKey
{
  return self->_srtpMasterKey;
}

- (NSData)srtpMasterSalt
{
  return self->_srtpMasterSalt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srtpMasterSalt, 0);
  objc_storeStrong((id *)&self->_srtpMasterKey, 0);
  objc_storeStrong((id *)&self->_srtpCryptoSuite, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
