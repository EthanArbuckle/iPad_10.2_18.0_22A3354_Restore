@implementation HMSoftwareUpdateDescriptor

- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(id)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(id)a9
{
  id v16;
  id v17;
  id v18;
  HMSoftwareUpdateDescriptor *v19;
  HMSoftwareUpdateDescriptor *v20;
  uint64_t v21;
  NSString *humanReadableUpdateName;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a4;
  v25 = a5;
  v24 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HMSoftwareUpdateDescriptor;
  v19 = -[HMSoftwareUpdateDescriptor init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_status = a3;
    objc_storeStrong((id *)&v19->_error, a4);
    objc_storeStrong((id *)&v20->_documentationMetadata, a5);
    objc_storeStrong((id *)&v20->_version, a6);
    objc_storeStrong((id *)&v20->_downloadSize, a7);
    v21 = objc_msgSend(v17, "copy");
    humanReadableUpdateName = v20->_humanReadableUpdateName;
    v20->_humanReadableUpdateName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_rampFeatureEnabledOnServer, a9);
  }

  return v20;
}

- (id)protoPayload
{
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor);
  -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setStatus:](v3, "setStatus:", -[HMSoftwareUpdateDescriptor status](self, "status"));
  -[HMSoftwareUpdateDescriptor downloadSize](self, "downloadSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMSoftwareUpdateDescriptor downloadSize](self, "downloadSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setDownloadSize:](v3, "setDownloadSize:", objc_msgSend(v5, "unsignedLongLongValue"));

  }
  -[HMSoftwareUpdateDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMSoftwareUpdateDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setHumanReadableUpdateName:](v3, "setHumanReadableUpdateName:", v7);

  }
  -[HMSoftwareUpdateDescriptor rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMSoftwareUpdateDescriptor rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setRampEnabled:](v3, "setRampEnabled:", objc_msgSend(v9, "BOOLValue"));

  }
  -[HMSoftwareUpdateDescriptor error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMSoftwareUpdateDescriptor error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setErrorCode:](v3, "setErrorCode:", objc_msgSend(v11, "code"));

  }
  -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetURL:](v3, "setServerAssetURL:", v15);

    -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "digest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "algorithm");
    HMFDigestAlgorithmToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetAlgorithm:](v3, "setServerAssetAlgorithm:", v18);

    -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "digest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetMeasurement:](v3, "setServerAssetMeasurement:", v21);

  }
  -[HMSoftwareUpdateDescriptor version](self, "version");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[HMSoftwareUpdateDescriptor version](self, "version");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setMajorVersion:](v3, "setMajorVersion:", objc_msgSend(v23, "majorVersion"));

    -[HMSoftwareUpdateDescriptor version](self, "version");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setMinorVersion:](v3, "setMinorVersion:", objc_msgSend(v24, "minorVersion"));

    -[HMSoftwareUpdateDescriptor version](self, "version");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setUpdateVersion:](v3, "setUpdateVersion:", objc_msgSend(v25, "updateVersion"));

    -[HMSoftwareUpdateDescriptor version](self, "version");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buildVersion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setBuildVersion:](v3, "setBuildVersion:", v27);

  }
  return v3;
}

- (HMSoftwareUpdateDescriptor)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateDescriptor *v6;
  NSObject *v7;
  void *v8;
  HMSoftwareUpdateDescriptor *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasStatus") & 1) != 0)
  {
    v25 = objc_msgSend(v4, "status");
    v29 = objc_msgSend(v4, "hasDownloadSize");
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "downloadSize"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v28 = objc_msgSend(v4, "hasHumanReadableUpdateName");
    if (v28)
    {
      objc_msgSend(v4, "humanReadableUpdateName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    v27 = objc_msgSend(v4, "hasRampEnabled");
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "rampEnabled"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    v26 = objc_msgSend(v4, "hasErrorCode");
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "errorCode"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v24 = objc_msgSend(v4, "hasServerAssetURL");
    if (v24)
    {
      v10 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v4, "serverAssetURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLWithString:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v23 = objc_msgSend(v4, "hasServerAssetAlgorithm");
    if (v23)
    {
      objc_msgSend(v4, "serverAssetAlgorithm");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    v22 = objc_msgSend(v4, "hasServerAssetMeasurement");
    if (v22)
    {
      objc_msgSend(v4, "serverAssetMeasurement");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v12 = objc_msgSend(v4, "hasMajorVersion");
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "majorVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_msgSend(v4, "hasMinorVersion");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "minorVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v16 = objc_msgSend(v4, "hasUpdateVersion");
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "updateVersion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if ((objc_msgSend(v4, "hasBuildVersion") & 1) != 0)
    {
      objc_msgSend(v4, "buildVersion");
      v18 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HMSoftwareUpdateDescriptor initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:", v25, v35, v34, v33, v32, v18, v31, v30, v13, v15, v17, v19);

      v11 = v18;
      if (!v16)
      {
LABEL_40:
        if (v14)
        {

          if (!v12)
            goto LABEL_43;
        }
        else if (!v12)
        {
LABEL_43:
          if (v22)

          if (v23)
          if (v24)
          {

          }
          if (v26)

          if (v27)
          if (v28)

          if (v29)
          v9 = v6;
          goto LABEL_58;
        }

        goto LABEL_43;
      }
    }
    else
    {
      v6 = -[HMSoftwareUpdateDescriptor initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:](self, "initWithStatus:downloadSize:humanReadableUpdateName:rampEnabled:errorCode:serverAssetURL:serverAssetAlgorithm:serverAssetMeasurement:majorVersion:minorVersion:updateVersion:buildVersion:", v25, v35, v34, v33, v32, v11, v31, v30, v13, v15, v17, 0);
      if (!v16)
        goto LABEL_40;
    }

    goto LABEL_40;
  }
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v8;
    v38 = 2112;
    v39 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Proto payload HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor is missing data: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = 0;
LABEL_58:

  return v9;
}

- (HMSoftwareUpdateDescriptor)initWithStatus:(int64_t)a3 downloadSize:(id)a4 humanReadableUpdateName:(id)a5 rampEnabled:(id)a6 errorCode:(id)a7 serverAssetURL:(id)a8 serverAssetAlgorithm:(id)a9 serverAssetMeasurement:(id)a10 majorVersion:(id)a11 minorVersion:(id)a12 updateVersion:(id)a13 buildVersion:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMSoftwareUpdateDocumentationMetadata *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HMSoftwareUpdateDescriptor *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  HMSoftwareUpdateDescriptor *v37;
  void *v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v47 = a7;
  v46 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = 0;
  v39 = v20;
  v40 = v19;
  if (v23 && v22 && v21 && v20 && v46 && v18)
  {
    v25 = 0;
    if (v19)
    {
      v26 = HMFDigestAlgorithmFromString();
      if (v26)
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28568]), "initWithAlgorithm:value:", v26, v19);
        v25 = -[HMSoftwareUpdateDocumentationMetadata initWithURL:digest:]([HMSoftwareUpdateDocumentationMetadata alloc], "initWithURL:digest:", v46, v27);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286A0]), "initWithMajorVersion:minorVersion:updateVersion:buildVersion:", objc_msgSend(v20, "unsignedIntValue"), objc_msgSend(v21, "unsignedIntValue"), objc_msgSend(v22, "unsignedIntValue"), v23);

      }
      else
      {
        v28 = (void *)MEMORY[0x1A1AC1AAC]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v49 = v31;
          v50 = 2112;
          v51 = v18;
          _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid algorithm string: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        v24 = 0;
        v25 = 0;
      }
    }
  }
  else
  {
    v25 = 0;
  }
  v32 = v22;
  if (v47 && ((v33 = objc_msgSend(v47, "integerValue"), v33 > 0x3B) ? (v34 = -1) : (v34 = v33), v34))
  {
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMSoftwareUpdateV2ErrorDomain"), v34, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = v21;
    v36 = 0;
  }
  v37 = -[HMSoftwareUpdateDescriptor initWithStatus:error:documentationMetadata:version:downloadSize:humanReadableUpdateName:rampFeatureEnabledOnServer:](self, "initWithStatus:error:documentationMetadata:version:downloadSize:humanReadableUpdateName:rampFeatureEnabledOnServer:", a3, v36, v25, v24, v44, v43, v42);

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  char v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_12;
  -[HMSoftwareUpdateDescriptor version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_12;
  v10 = -[HMSoftwareUpdateDescriptor status](self, "status");
  if (v10 != objc_msgSend(v6, "status"))
    goto LABEL_12;
  -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentationMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = HMFEqualObjects();

  if (!v13)
    goto LABEL_12;
  -[HMSoftwareUpdateDescriptor downloadSize](self, "downloadSize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadSize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = HMFEqualObjects();

  if (!v16)
    goto LABEL_12;
  -[HMSoftwareUpdateDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "humanReadableUpdateName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = HMFEqualObjects();

  if (!v19)
    goto LABEL_12;
  -[HMSoftwareUpdateDescriptor rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rampFeatureEnabledOnServer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  if (v22)
  {
    -[HMSoftwareUpdateDescriptor error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HMFEqualObjects();

  }
  else
  {
LABEL_12:
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[HMSoftwareUpdateDescriptor status](self, "status");
  -[HMSoftwareUpdateDescriptor downloadSize](self, "downloadSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue") ^ v3;
  -[HMSoftwareUpdateDescriptor version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMSoftwareUpdateDescriptor *v4;
  void *v5;
  HMSoftwareUpdateDescriptor *v6;

  v4 = [HMSoftwareUpdateDescriptor alloc];
  -[HMSoftwareUpdateDescriptor protoPayload](self, "protoPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSoftwareUpdateDescriptor initWithProtoPayload:](v4, "initWithProtoPayload:", v5);

  return v6;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMSoftwareUpdateDescriptor status](self, "status"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("status"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor error](self, "error");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("error"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor documentationMetadata](self, "documentationMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("documentationMetadata"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("version"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor downloadSize](self, "downloadSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("downloadSize"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor humanReadableUpdateName](self, "humanReadableUpdateName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("humanReadableUpdateName"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateDescriptor rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("rampFeatureEnabledOnServer"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 24, 1);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)downloadSize
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)rampFeatureEnabledOnServer
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRampFeatureEnabledOnServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampFeatureEnabledOnServer, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)descriptorFromEvent:(id)a3
{
  id v4;
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *v5;
  void *v6;
  HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *v7;
  HMSoftwareUpdateDescriptor *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor alloc];
  objc_msgSend(v4, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor initWithData:](v5, "initWithData:", v6);

  if (v7)
  {
    v8 = -[HMSoftwareUpdateDescriptor initWithProtoPayload:]([HMSoftwareUpdateDescriptor alloc], "initWithProtoPayload:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor from event: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
