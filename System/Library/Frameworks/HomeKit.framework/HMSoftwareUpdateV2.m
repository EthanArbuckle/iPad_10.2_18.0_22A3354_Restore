@implementation HMSoftwareUpdateV2

- (HMSoftwareUpdateV2)initWithStatus:(int64_t)a3 error:(id)a4 documentationMetadata:(id)a5 version:(id)a6 downloadSize:(unint64_t)a7 humanReadableUpdateName:(id)a8 rampFeatureEnabledOnServer:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMSoftwareUpdateV2 *v19;
  HMSoftwareUpdateV2 *v20;
  uint64_t v21;
  NSString *humanReadableUpdateName;
  objc_super v25;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMSoftwareUpdateV2;
  v19 = -[HMSoftwareUpdateV2 init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_status = a3;
    objc_storeStrong((id *)&v19->_error, a4);
    objc_storeStrong((id *)&v20->_documentationMetadata, a5);
    objc_storeStrong((id *)&v20->_version, a6);
    v20->_downloadSize = a7;
    v21 = objc_msgSend(v18, "copy");
    humanReadableUpdateName = v20->_humanReadableUpdateName;
    v20->_humanReadableUpdateName = (NSString *)v21;

    v20->_rampFeatureEnabledOnServer = a9;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMSoftwareUpdateV2 status](self, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMSoftwareUpdateV2 error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[HMSoftwareUpdateV2 documentationMetadata](self, "documentationMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[HMSoftwareUpdateV2 version](self, "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMSoftwareUpdateV2 downloadSize](self, "downloadSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[HMSoftwareUpdateV2 humanReadableUpdateName](self, "humanReadableUpdateName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateV2 *v4;
  HMSoftwareUpdateV2 *v5;
  HMSoftwareUpdateV2 *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  _BOOL4 v22;

  v4 = (HMSoftwareUpdateV2 *)a3;
  if (self == v4)
  {
    LOBYTE(v22) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_13;
    v7 = -[HMSoftwareUpdateV2 status](self, "status");
    if (v7 != -[HMSoftwareUpdateV2 status](v6, "status"))
      goto LABEL_13;
    -[HMSoftwareUpdateV2 error](self, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateV2 error](v6, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if (!v10)
      goto LABEL_13;
    -[HMSoftwareUpdateV2 documentationMetadata](self, "documentationMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateV2 documentationMetadata](v6, "documentationMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (!v13)
      goto LABEL_13;
    -[HMSoftwareUpdateV2 version](self, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateV2 version](v6, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HMFEqualObjects();

    if (!v16)
      goto LABEL_13;
    v17 = -[HMSoftwareUpdateV2 downloadSize](self, "downloadSize");
    if (v17 != -[HMSoftwareUpdateV2 downloadSize](v6, "downloadSize"))
      goto LABEL_13;
    -[HMSoftwareUpdateV2 humanReadableUpdateName](self, "humanReadableUpdateName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateV2 humanReadableUpdateName](v6, "humanReadableUpdateName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if (v20)
    {
      v21 = -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer");
      v22 = v21 ^ -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](v6, "rampFeatureEnabledOnServer") ^ 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v22) = 0;
    }

  }
  return v22;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMSoftwareUpdateV2 status](self, "status"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("status"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateV2 error](self, "error");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("error"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateV2 documentationMetadata](self, "documentationMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("documentationMetadata"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateV2 version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("version"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMSoftwareUpdateV2 downloadSize](self, "downloadSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("downloadSize"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSoftwareUpdateV2 humanReadableUpdateName](self, "humanReadableUpdateName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("humanReadableUpdateName"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSoftwareUpdateV2 rampFeatureEnabledOnServer](self, "rampFeatureEnabledOnServer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("rampFeatureEnabledOnServer"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v19;
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
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDocumentationMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (NSString)humanReadableUpdateName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHumanReadableUpdateName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)rampFeatureEnabledOnServer
{
  return self->_rampFeatureEnabledOnServer;
}

- (void)setRampFeatureEnabledOnServer:(BOOL)a3
{
  self->_rampFeatureEnabledOnServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (id)softwareUpdateFromDescriptor:(id)a3
{
  id v3;
  HMSoftwareUpdateV2 *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMSoftwareUpdateV2 *v13;
  uint64_t v15;

  if (a3)
  {
    v3 = a3;
    v4 = [HMSoftwareUpdateV2 alloc];
    v5 = objc_msgSend(v3, "status");
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentationMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntValue");
    objc_msgSend(v3, "humanReadableUpdateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rampFeatureEnabledOnServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v15) = objc_msgSend(v12, "BOOLValue");
    v13 = -[HMSoftwareUpdateV2 initWithStatus:error:documentationMetadata:version:downloadSize:humanReadableUpdateName:rampFeatureEnabledOnServer:](v4, "initWithStatus:error:documentationMetadata:version:downloadSize:humanReadableUpdateName:rampFeatureEnabledOnServer:", v5, v6, v7, v8, v10, v11, v15);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
