@implementation HMDHAPMetadataAssistantCharacteristic

- (HMDHAPMetadataAssistantCharacteristic)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDHAPMetadataAssistantCharacteristic)initWithName:(id)a3 readHAPCharacteristic:(id)a4 writeHAPCharacteristic:(id)a5 format:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  HMDHAPMetadataAssistantCharacteristic *v14;
  HMDHAPMetadataAssistantCharacteristic *v15;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSString *readHAPCharacteristicName;
  uint64_t v20;
  NSString *writeHAPCharacteristicName;
  uint64_t v22;
  HMDHAPMetadataAssistantCharacteristic *format;
  objc_super v25;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HMDHAPMetadataAssistantCharacteristic;
  v14 = -[HMDHAPMetadataAssistantCharacteristic init](&v25, sel_init);
  v15 = v14;
  if (v10 && v11 | v12)
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      name = v15->_name;
      v15->_name = (NSString *)v16;

      objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
      readHAPCharacteristicName = v15->_readHAPCharacteristicName;
      v15->_readHAPCharacteristicName = (NSString *)v18;

      objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v12);
      v20 = objc_claimAutoreleasedReturnValue();
      writeHAPCharacteristicName = v15->_writeHAPCharacteristicName;
      v15->_writeHAPCharacteristicName = (NSString *)v20;

      objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v13);
      v22 = objc_claimAutoreleasedReturnValue();
      format = (HMDHAPMetadataAssistantCharacteristic *)v15->_format;
      v15->_format = (NSString *)v22;
    }
    else
    {
      format = 0;
    }
  }
  else
  {
    format = v14;
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHAPMetadataAssistantCharacteristic name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataAssistantCharacteristic readHAPCharacteristicName](self, "readHAPCharacteristicName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataAssistantCharacteristic writeHAPCharacteristicName](self, "writeHAPCharacteristicName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPMetadataAssistantCharacteristic format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Assistant characteristic %@: readHAP %@  writeHAP %@, format %@ supportsLocalization %ld"), v4, v5, v6, v7, -[HMDHAPMetadataAssistantCharacteristic supportsLocalization](self, "supportsLocalization"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)readHAPCharacteristicName
{
  return self->_readHAPCharacteristicName;
}

- (void)setReadHAPCharacteristicName:(id)a3
{
  objc_storeStrong((id *)&self->_readHAPCharacteristicName, a3);
}

- (NSString)writeHAPCharacteristicName
{
  return self->_writeHAPCharacteristicName;
}

- (void)setWriteHAPCharacteristicName:(id)a3
{
  objc_storeStrong((id *)&self->_writeHAPCharacteristicName, a3);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (BOOL)supportsLocalization
{
  return self->_supportsLocalization;
}

- (void)setSupportsLocalization:(BOOL)a3
{
  self->_supportsLocalization = a3;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (NSDictionary)outValues
{
  return self->_outValues;
}

- (void)setOutValues:(id)a3
{
  objc_storeStrong((id *)&self->_outValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outValues, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_writeHAPCharacteristicName, 0);
  objc_storeStrong((id *)&self->_readHAPCharacteristicName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
