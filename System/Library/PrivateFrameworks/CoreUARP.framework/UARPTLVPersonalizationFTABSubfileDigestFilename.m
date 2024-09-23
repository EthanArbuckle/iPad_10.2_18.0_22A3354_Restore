@implementation UARPTLVPersonalizationFTABSubfileDigestFilename

- (UARPTLVPersonalizationFTABSubfileDigestFilename)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  return -[UARPMetaDataTLVString init](&v3, sel_init);
}

- (void)setFilename:(id)a3
{
  UARPTLVPersonalizationFTABSubfileDigestFilename *v4;
  uint64_t v5;
  NSString *filename;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  filename = v4->_filename;
  v4->_filename = (NSString *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[UARPTLVPersonalizationFTABSubfileDigestFilename metaDataTableEntry](UARPTLVPersonalizationFTABSubfileDigestFilename, "metaDataTableEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v5, self->_filename);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tlvType
{
  return -2001563338;
}

- (id)generateTLV
{
  uint64_t v3;
  NSString *filename;
  objc_super v6;

  v3 = +[UARPTLVPersonalizationFTABSubfileDigestFilename tlvType](UARPTLVPersonalizationFTABSubfileDigestFilename, "tlvType");
  filename = self->_filename;
  v6.receiver = self;
  v6.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  -[UARPMetaDataTLVString generateTLV:tlvValue:](&v6, sel_generateTLV_tlvValue_, v3, filename);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tlvValue
{
  NSString *filename;
  objc_super v4;

  filename = self->_filename;
  v4.receiver = self;
  v4.super_class = (Class)UARPTLVPersonalizationFTABSubfileDigestFilename;
  -[UARPMetaDataTLVString tlvValue:](&v4, sel_tlvValue_, filename);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)metaDataTableEntry
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = &unk_24CEC1028;
  v5[0] = CFSTR("Name");
  v5[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", +[UARPTLVPersonalizationFTABSubfileDigestFilename tlvType](UARPTLVPersonalizationFTABSubfileDigestFilename, "tlvType"));
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
    objc_msgSend(v4, "setFilename:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  char *v4;
  void *v5;
  void *v6;

  v4 = strndup((const char *)a4, a3);
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilename:", v6);

  free(v4);
  return v5;
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
