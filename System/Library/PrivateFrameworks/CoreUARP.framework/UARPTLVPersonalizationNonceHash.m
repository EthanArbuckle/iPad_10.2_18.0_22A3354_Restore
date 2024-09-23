@implementation UARPTLVPersonalizationNonceHash

- (UARPTLVPersonalizationNonceHash)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationNonceHash;
  return -[UARPMetaDataTLVData init](&v3, sel_init);
}

- (void)setNonceHash:(id)a3
{
  UARPTLVPersonalizationNonceHash *v4;
  uint64_t v5;
  NSData *nonceHash;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  nonceHash = v4->_nonceHash;
  v4->_nonceHash = (NSData *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UARPTLVPersonalizationNonceHash metaDataTableEntry](UARPTLVPersonalizationNonceHash, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_nonceHash);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563384;
}

- (id)generateTLV
{
  uint64_t v3;
  NSData *nonceHash;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationNonceHash tlvType](UARPTLVPersonalizationNonceHash, "tlvType");
  nonceHash = self->_nonceHash;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationNonceHash;
  -[UARPMetaDataTLVData generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, nonceHash);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  return self->_nonceHash;
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("Personalization Nonce Hash");
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationNonceHash tlvType](UARPTLVPersonalizationNonceHash, "tlvType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setNonceHash:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNonceHash:", v7);

  return v6;
}

- (NSData)nonceHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonceHash, 0);
}

@end
