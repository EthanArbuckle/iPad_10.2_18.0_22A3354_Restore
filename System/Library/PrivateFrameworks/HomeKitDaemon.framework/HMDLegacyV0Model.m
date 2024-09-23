@implementation HMDLegacyV0Model

- (HMDLegacyV0Model)init
{
  void *v3;
  void *v4;
  HMDLegacyV0Model *v5;
  objc_super v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("ABE49D63-6AE9-4469-A7EF-AC020E0104B3"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v7.receiver = self;
  v7.super_class = (Class)HMDLegacyV0Model;
  v5 = -[HMBModel initWithModelID:parentModelID:](&v7, sel_initWithModelID_parentModelID_, v3, v4);

  return v5;
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDLegacyV0Model *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  HMDLegacyV0Model *v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  HMDLegacyV0Model *v45;
  NSObject *v46;
  void *v47;
  objc_class *v48;
  id v49;
  id v50;
  void *v51;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  const __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_33;
  }
  if (!v9)
  {
    objc_msgSend(v10, "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x24BDB91E8]);
      objc_msgSend(v25, "zoneID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithRecordName:zoneID:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5"), v27);

      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("HomeDataBlob"), v28);
      goto LABEL_15;
    }
LABEL_33:
    _HMFPreconditionFailure();
  }
  objc_msgSend(v9, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5"));

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordID");
      v54 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v20;
      v62 = 2112;
      v63 = v22;
      v64 = 2112;
      v65 = CFSTR("84968B22-8974-4102-AAA6-7B9C763A14B5");
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@UNEXPECTED RECORD NAME MISMATCH (V0) %@ != %@", buf, 0x20u);

      v10 = v54;
      v17 = v53;
    }

    objc_autoreleasePoolPop(v17);
  }
LABEL_15:
  -[HMDLegacyV0Model cloudBlob](self, "cloudBlob");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v13, "encryptData:compress:error:", v29, 0, &v59);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (__CFString *)v59;

  if (v31 || !v30)
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v55 = v11;
      v41 = v13;
      v42 = v10;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = v39;
      v62 = 2112;
      v63 = v43;
      v64 = 2112;
      v65 = v31;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeWithExistingRecord:error:] failed encryption: %@", buf, 0x20u);

      v10 = v42;
      v13 = v41;
      v11 = v55;

    }
    objc_autoreleasePoolPop(v36);
    if (a6)
    {
      v31 = objc_retainAutorelease(v31);
      v35 = 0;
      *a6 = v31;
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("kRecordEncodedDataBlobKey"));
    -[HMDLegacyV0Model cloudBlobV2](self, "cloudBlobV2");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v13, "encryptData:compress:error:", v32, 1, &v58);
    v33 = objc_claimAutoreleasedReturnValue();
    v31 = (__CFString *)v58;

    if (v31 || !v33)
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v56 = v11;
        v49 = v13;
        v50 = v10;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = v47;
        v62 = 2112;
        v63 = v51;
        v64 = 2112;
        v65 = v31;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@-[%@ encodeWithExistingRecord:error:] failed encryption: %@", buf, 0x20u);

        v10 = v50;
        v13 = v49;
        v11 = v56;

      }
      objc_autoreleasePoolPop(v44);
      if (a6)
      {
        v31 = objc_retainAutorelease(v31);
        v35 = 0;
        *a6 = v31;
      }
      else
      {
        v35 = 0;
      }
    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("kRecordEncodedDataBlobVersion2Key"));
      -[HMDLegacyV0Model cloudBlobsReadOnly](self, "cloudBlobsReadOnly");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, CFSTR("kRecordReadOnly"));

      v35 = v9;
      v31 = 0;
    }
    v30 = (void *)v33;
  }

  return v35;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_152283 != -1)
    dispatch_once(&hmbProperties_onceToken_152283, &__block_literal_global_152284);
  return (id)hmbProperties__properties_152285;
}

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  HMDLegacyV0Model *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  HMDLegacyV0Model *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *context;
  void *contexta;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("HomeDataBlob"));

  if ((v11 & 1) != 0)
  {
    v12 = objc_alloc_init(HMDLegacyV0Model);
    if (!v12)
    {
      v22 = 0;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v42 = 0;
      objc_msgSend(v9, "decryptData:decompress:error:", v13, 0, &v42);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v42;
      if (v15)
      {
        v16 = v15;
        context = (void *)MEMORY[0x227676638]();
        v17 = a1;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = v14;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v19;
          v45 = 2112;
          v46 = v21;
          v47 = 2112;
          v48 = v16;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

          v14 = v37;
        }

        objc_autoreleasePoolPop(context);
        if (a5)
          *a5 = objc_retainAutorelease(v16);

        v22 = 0;
        goto LABEL_29;
      }
      if (v14)
        -[HMDLegacyV0Model setCloudBlob:](v12, "setCloudBlob:", v14);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRecordEncodedDataBlobVersion2Key"));
    v23 = objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v41 = 0;
      objc_msgSend(v9, "decryptData:decompress:error:", v23, 1, &v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v41;
      if (v25)
      {
        v26 = v25;
        v27 = (void *)MEMORY[0x227676638]();
        v28 = a1;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = v24;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          contexta = v27;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v30;
          v45 = 2112;
          v46 = v32;
          v47 = 2112;
          v48 = v26;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@ unable to decrypt data: %@", buf, 0x20u);

          v27 = contexta;
          v24 = v38;
        }

        objc_autoreleasePoolPop(v27);
        if (a5)
          *a5 = objc_retainAutorelease(v26);

        v22 = 0;
        goto LABEL_28;
      }
      if (v24)
        -[HMDLegacyV0Model setCloudBlobV2:](v12, "setCloudBlobV2:", v24);

    }
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kRecordReadOnly"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "BOOLValue"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBModel hmbSetProperty:named:](v12, "hmbSetProperty:named:", v35, CFSTR("cloudBlobsReadOnly"));

    v22 = v12;
LABEL_28:
    v13 = (void *)v23;
LABEL_29:

    goto LABEL_30;
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
LABEL_31:

  return v22;
}

void __33__HMDLegacyV0Model_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("cloudBlob");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("cloudBlobV2");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("cloudBlobsReadOnly");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)hmbProperties__properties_152285;
  hmbProperties__properties_152285 = v3;

}

@end
