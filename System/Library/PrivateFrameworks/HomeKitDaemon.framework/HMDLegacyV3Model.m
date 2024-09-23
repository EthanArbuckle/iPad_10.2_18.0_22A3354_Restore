@implementation HMDLegacyV3Model

- (HMDLegacyV3Model)init
{
  void *v3;
  void *v4;
  HMDLegacyV3Model *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("5E034157-5CED-4502-9C16-9428C798883A"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyV3Model;
  v5 = -[HMBModel initWithModelID:parentModelID:](&v7, sel_initWithModelID_parentModelID_, v3, v4);

  return v5;
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMDLegacyV3Model *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  void *v32;
  HMDLegacyV3Model *v33;
  NSObject *v34;
  void *v35;
  objc_class *v36;
  id v37;
  id *v38;
  void *v39;
  void *v41;
  id *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    objc_msgSend(v10, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41"));

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = a6;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "recordID");
        v41 = v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "recordName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v19;
        v47 = 2112;
        v48 = v21;
        v49 = 2112;
        v50 = CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41");
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@UNEXPECTED RECORD NAME MISMATCH (V3) %@ != %@", buf, 0x20u);

        v16 = v41;
        a6 = v42;
      }

      objc_autoreleasePoolPop(v16);
    }
  }
  else
  {
    objc_msgSend(v11, "zoneID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (!v24)
      _HMFPreconditionFailure();
    v25 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v24, "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithRecordName:zoneID:", CFSTR("BC9706E1-E72E-4152-A2A6-417AD742DC41"), v26);

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("HomeDataBlobV3"), v27);
  }
  -[HMDLegacyV3Model cloudBlob](self, "cloudBlob");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v12, "encryptData:compress:error:", v28, 1, &v44);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (__CFString *)v44;

  if (v30 || !v29)
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v43 = v12;
      v37 = v11;
      v38 = a6;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v35;
      v47 = 2112;
      v48 = v39;
      v49 = 2112;
      v50 = v30;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeForCloudZone:error:] failed encryption: %@", buf, 0x20u);

      a6 = v38;
      v11 = v37;
      v12 = v43;

    }
    objc_autoreleasePoolPop(v32);
    v31 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v30);
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("kRecordEncodedDataBlobKey"));
    v31 = v10;
  }

  return v31;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_106936 != -1)
    dispatch_once(&hmbProperties_onceToken_106936, &__block_literal_global_106937);
  return (id)hmbProperties__properties_106938;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  void *context;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!v11)
    _HMFPreconditionFailure();
  objc_msgSend(v8, "recordType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", CFSTR("HomeDataBlobV3"));

  if ((v13 & 1) != 0)
  {
    v14 = objc_alloc_init((Class)a1);
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v27 = 0;
        objc_msgSend(v11, "decryptData:decompress:error:", v15, 1, &v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v27;
        if (v17)
        {
          v18 = v17;
          context = (void *)MEMORY[0x227676638]();
          v19 = (objc_class *)a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(v19);
            v24 = v16;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v29 = v25;
            v30 = 2112;
            v31 = v21;
            v32 = 2112;
            v33 = v18;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

            v16 = v24;
          }

          objc_autoreleasePoolPop(context);
          if (a5)
            *a5 = objc_retainAutorelease(v18);

          v22 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v14, "setCloudBlob:", v16);

      }
    }
    v22 = v14;
LABEL_20:

    goto LABEL_21;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_21:

  return v22;
}

void __33__HMDLegacyV3Model_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("cloudBlob");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_106938;
  hmbProperties__properties_106938 = v1;

}

@end
