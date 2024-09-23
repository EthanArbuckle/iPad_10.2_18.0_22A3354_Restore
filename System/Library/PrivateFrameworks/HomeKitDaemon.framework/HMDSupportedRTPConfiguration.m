@implementation HMDSupportedRTPConfiguration

- (HMDSupportedRTPConfiguration)initWithCryptoSuites:(id)a3
{
  id v4;
  HMDSupportedRTPConfiguration *v5;
  uint64_t v6;
  NSArray *srtpCryptoSuites;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSupportedRTPConfiguration;
  v5 = -[HMDSupportedRTPConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    srtpCryptoSuites = v5->_srtpCryptoSuites;
    v5->_srtpCryptoSuites = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSArray *v6;
  NSArray *srtpCryptoSuites;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B9F0], "wrappertlv:name:objectCreator:", 2, CFSTR("kSupportedRTPParameters__SRTPCryptoSuite"), &__block_literal_global_407);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAPTLVBase _parse:](self, "_parse:", v4);
  if (v5)
  {
    objc_msgSend(v3, "field");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    srtpCryptoSuites = self->_srtpCryptoSuites;
    self->_srtpCryptoSuites = v6;

  }
  return v5;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1BC10], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDSupportedRTPConfiguration srtpCryptoSuites](self, "srtpCryptoSuites", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "srtpCryptoSuite"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addTLV:number:", 2, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDSupportedRTPConfiguration srtpCryptoSuites](self, "srtpCryptoSuites");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  arrayToString(v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ srtpCryptoSuites = %@ "), v6, v9);

}

- (HMDSupportedRTPConfiguration)initWithCoder:(id)a3
{
  id v4;
  HMDSupportedRTPConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *srtpCryptoSuites;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDSupportedRTPConfiguration;
  v5 = -[HMDSupportedRTPConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kSupportedRTPParameters__SRTPCryptoSuite"));
    v9 = objc_claimAutoreleasedReturnValue();
    srtpCryptoSuites = v5->_srtpCryptoSuites;
    v5->_srtpCryptoSuites = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSupportedRTPConfiguration srtpCryptoSuites](self, "srtpCryptoSuites");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSupportedRTPParameters__SRTPCryptoSuite"));

}

- (NSArray)srtpCryptoSuites
{
  return self->_srtpCryptoSuites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srtpCryptoSuites, 0);
}

HMDSRTPCryptoSuite *__49__HMDSupportedRTPConfiguration__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDSRTPCryptoSuite *v3;

  v2 = a2;
  v3 = -[HMDSRTPCryptoSuite initWithTLVData:]([HMDSRTPCryptoSuite alloc], "initWithTLVData:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
