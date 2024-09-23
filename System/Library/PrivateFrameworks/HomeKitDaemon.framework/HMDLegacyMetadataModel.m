@implementation HMDLegacyMetadataModel

- (HMDLegacyMetadataModel)init
{
  void *v3;
  void *v4;
  HMDLegacyMetadataModel *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("457C009B-1DA4-4B71-BD69-93D344A81A8B"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyMetadataModel;
  v5 = -[HMBModel initWithModelID:parentModelID:](&v7, sel_initWithModelID_parentModelID_, v3, v4);

  return v5;
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_msgSend(v9, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300"));

    if ((v14 & 1) != 0)
    {
LABEL_9:
      -[HMDLegacyMetadataModel cloudMetadata](self, "cloudMetadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("kRecordEncodedDataBlobKey"));

      return v9;
    }
    _HMFPreconditionFailure();
  }
  objc_msgSend(v10, "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v17, "zoneID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithRecordName:zoneID:", CFSTR("9C3BF4D1-C7CF-4217-BCD2-0F7E96D5B300"), v19);

    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("MetadataBlob"), v20);
    goto LABEL_9;
  }
  v23 = (void *)_HMFPreconditionFailure();
  return +[HMDLegacyMetadataModel hmbProperties](v23, v24);
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_219894 != -1)
    dispatch_once(&hmbProperties_onceToken_219894, &__block_literal_global_219895);
  return (id)hmbProperties__properties_219896;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  objc_msgSend(v7, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("MetadataBlob"));

  if ((v9 & 1) != 0)
  {
    v10 = objc_alloc_init((Class)a1);
    if (v10)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCloudMetadata:", v12);

      }
    }
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __39__HMDLegacyMetadataModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("cloudMetadata");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_219896;
  hmbProperties__properties_219896 = v1;

}

@end
