@implementation HKCloudSyncRequest

- (HKCloudSyncRequest)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKCloudSyncRequest)initWithIdentifier:(id)a3 changesSyncRequest:(id)a4 contextSyncRequest:(id)a5 stateSyncRequest:(id)a6 medicalIDSyncRequest:(id)a7 summarySharingSyncRequest:(id)a8 allowCellular:(BOOL)a9 qualityOfService:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKCloudSyncRequest *v22;
  uint64_t v23;
  NSUUID *identifier;
  uint64_t v25;
  HKChangesSyncRequest *changesSyncRequest;
  uint64_t v27;
  HKContextSyncRequest *contextSyncRequest;
  uint64_t v29;
  HKStateSyncRequest *stateSyncRequest;
  uint64_t v31;
  HKMedicalIDSyncRequest *medicalIDSyncRequest;
  uint64_t v33;
  HKSummarySharingSyncRequest *summarySharingSyncRequest;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v36.receiver = self;
  v36.super_class = (Class)HKCloudSyncRequest;
  v22 = -[HKCloudSyncRequest init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    v25 = objc_msgSend(v17, "copy");
    changesSyncRequest = v22->_changesSyncRequest;
    v22->_changesSyncRequest = (HKChangesSyncRequest *)v25;

    v27 = objc_msgSend(v18, "copy");
    contextSyncRequest = v22->_contextSyncRequest;
    v22->_contextSyncRequest = (HKContextSyncRequest *)v27;

    v29 = objc_msgSend(v19, "copy");
    stateSyncRequest = v22->_stateSyncRequest;
    v22->_stateSyncRequest = (HKStateSyncRequest *)v29;

    v31 = objc_msgSend(v20, "copy");
    medicalIDSyncRequest = v22->_medicalIDSyncRequest;
    v22->_medicalIDSyncRequest = (HKMedicalIDSyncRequest *)v31;

    v33 = objc_msgSend(v21, "copy");
    summarySharingSyncRequest = v22->_summarySharingSyncRequest;
    v22->_summarySharingSyncRequest = (HKSummarySharingSyncRequest *)v33;

    v22->_allowCellular = a9;
    v22->_qualityOfService = a10;
  }

  return v22;
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7 allowCellular:(BOOL)a8 qualityOfService:(int64_t)a9
{
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HKCloudSyncRequest *v22;
  uint64_t v24;

  v15 = (void *)MEMORY[0x1E0CB3A28];
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v15, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a8;
  v22 = -[HKCloudSyncRequest initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:](self, "initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v21, v20, v19, v18, v17, v16, v24, a9);

  return v22;
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", a3, a4, a5, a6, a7, 0, -1);
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", a3, 0, 0, 0, 0);
}

- (HKCloudSyncRequest)initWithContextSyncRequest:(id)a3
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", 0, a3, 0, 0, 0);
}

- (HKCloudSyncRequest)initWithStateSyncRequest:(id)a3
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", 0, 0, a3, 0, 0);
}

- (HKCloudSyncRequest)initWithMedicalIDSyncRequest:(id)a3
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", 0, 0, 0, a3, 0);
}

- (HKCloudSyncRequest)initWithSummarySharingSyncRequest:(id)a3
{
  return -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:](self, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:", 0, 0, 0, 0, a3);
}

- (id)requestByMergingRequest:(id)a3
{
  id v4;
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
  HKCloudSyncRequest *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  HKCloudSyncRequest *v30;

  v4 = a3;
  objc_msgSend(v4, "changesSyncRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "changesSyncRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCloudSyncRequest changesSyncRequest](self, "changesSyncRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestByMergingRequest:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCloudSyncRequest changesSyncRequest](self, "changesSyncRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "contextSyncRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "contextSyncRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCloudSyncRequest contextSyncRequest](self, "contextSyncRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestByMergingRequest:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCloudSyncRequest contextSyncRequest](self, "contextSyncRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "stateSyncRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "stateSyncRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCloudSyncRequest stateSyncRequest](self, "stateSyncRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestByMergingRequest:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCloudSyncRequest stateSyncRequest](self, "stateSyncRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "medicalIDSyncRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v4, "medicalIDSyncRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCloudSyncRequest medicalIDSyncRequest](self, "medicalIDSyncRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestByMergingRequest:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCloudSyncRequest medicalIDSyncRequest](self, "medicalIDSyncRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v4, "summarySharingSyncRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(v4, "summarySharingSyncRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCloudSyncRequest summarySharingSyncRequest](self, "summarySharingSyncRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "requestByMergingRequest:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKCloudSyncRequest summarySharingSyncRequest](self, "summarySharingSyncRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v25 = [HKCloudSyncRequest alloc];
  if (-[HKCloudSyncRequest allowCellular](self, "allowCellular"))
    v26 = 1;
  else
    v26 = objc_msgSend(v4, "allowCellular");
  v27 = -[HKCloudSyncRequest qualityOfService](self, "qualityOfService");
  v28 = objc_msgSend(v4, "qualityOfService");
  if (v27 <= v28)
    v29 = v28;
  else
    v29 = v27;
  v30 = -[HKCloudSyncRequest initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:](v25, "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v8, v12, v16, v20, v24, v26, v29);

  return v30;
}

+ (id)emptySyncRequest
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithChangesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", 0, 0, 0, 0, 0, 0, -1);
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  HKChangesSyncRequest *v5;
  void *v6;
  HKChangesSyncRequest *changesSyncRequest;
  void *v8;
  int v9;
  HKContextSyncRequest *v10;
  HKContextSyncRequest *contextSyncRequest;
  void *v12;
  int v13;
  HKStateSyncRequest *v14;
  HKStateSyncRequest *stateSyncRequest;
  void *v16;
  int v17;
  HKSummarySharingSyncRequest *v18;
  HKSummarySharingSyncRequest *summarySharingSyncRequest;
  void *v20;
  int v21;
  HKMedicalIDSyncRequest *v22;
  HKMedicalIDSyncRequest *medicalIDSyncRequest;
  void *v24;
  int v25;
  BOOL v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  objc_msgSend(v4, "changesSyncRequest");
  v5 = (HKChangesSyncRequest *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  changesSyncRequest = self->_changesSyncRequest;
  if (v5 == changesSyncRequest)
  {

  }
  else
  {
    if (!changesSyncRequest)
      goto LABEL_26;
    objc_msgSend(v4, "changesSyncRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_changesSyncRequest);

    if (!v9)
      goto LABEL_27;
  }
  objc_msgSend(v4, "contextSyncRequest");
  v10 = (HKContextSyncRequest *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  contextSyncRequest = self->_contextSyncRequest;
  if (v10 == contextSyncRequest)
  {

  }
  else
  {
    if (!contextSyncRequest)
      goto LABEL_26;
    objc_msgSend(v4, "contextSyncRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", self->_contextSyncRequest);

    if (!v13)
      goto LABEL_27;
  }
  objc_msgSend(v4, "stateSyncRequest");
  v14 = (HKStateSyncRequest *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  stateSyncRequest = self->_stateSyncRequest;
  if (v14 == stateSyncRequest)
  {

  }
  else
  {
    if (!stateSyncRequest)
      goto LABEL_26;
    objc_msgSend(v4, "stateSyncRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", self->_stateSyncRequest);

    if (!v17)
      goto LABEL_27;
  }
  objc_msgSend(v4, "summarySharingSyncRequest");
  v18 = (HKSummarySharingSyncRequest *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  summarySharingSyncRequest = self->_summarySharingSyncRequest;
  if (v18 == summarySharingSyncRequest)
  {

  }
  else
  {
    if (!summarySharingSyncRequest)
      goto LABEL_26;
    objc_msgSend(v4, "summarySharingSyncRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", self->_summarySharingSyncRequest);

    if (!v21)
      goto LABEL_27;
  }
  objc_msgSend(v4, "medicalIDSyncRequest");
  v22 = (HKMedicalIDSyncRequest *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  medicalIDSyncRequest = self->_medicalIDSyncRequest;
  if (v22 != medicalIDSyncRequest)
  {
    if (medicalIDSyncRequest)
    {
      objc_msgSend(v4, "medicalIDSyncRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", self->_medicalIDSyncRequest);

      if (!v25)
        goto LABEL_27;
      goto LABEL_30;
    }
LABEL_26:

    goto LABEL_27;
  }

LABEL_30:
  if (self->_allowCellular == objc_msgSend(v4, "allowCellular"))
  {
    v26 = objc_msgSend(v4, "qualityOfService") == self->_qualityOfService;
    goto LABEL_28;
  }
LABEL_27:
  v26 = 0;
LABEL_28:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *identifier;
  void *v8;
  char v9;
  BOOL v10;

  v4 = a3;
  if (!-[HKCloudSyncRequest isEquivalent:](self, "isEquivalent:", v4))
    goto LABEL_9;
  objc_msgSend(v4, "identifier");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  identifier = self->_identifier;
  if (v5 == identifier)
  {

  }
  else
  {
    if (!identifier)
    {

LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_identifier);

    if ((v9 & 1) == 0)
      goto LABEL_9;
  }
  v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)matchesFilter:(unint64_t)a3
{
  char v3;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    -[HKCloudSyncRequest changesSyncRequest](self, "changesSyncRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14 == 0;

    if ((v3 & 2) != 0)
    {
LABEL_3:
      -[HKCloudSyncRequest contextSyncRequest](self, "contextSyncRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 == 0;

      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = 0;
    if ((a3 & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    -[HKCloudSyncRequest stateSyncRequest](self, "stateSyncRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if ((v3 & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v11 = 1;
    if ((v3 & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v13 = 1;
    return v11 & ~(v5 || v7 || v9) & v13;
  }
LABEL_9:
  v9 = 0;
  if ((v3 & 8) == 0)
    goto LABEL_10;
LABEL_5:
  -[HKCloudSyncRequest medicalIDSyncRequest](self, "medicalIDSyncRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  if ((v3 & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  -[HKCloudSyncRequest summarySharingSyncRequest](self, "summarySharingSyncRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v11 & ~(v5 || v7 || v9) & v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKChangesSyncRequest *changesSyncRequest;
  id v5;

  changesSyncRequest = self->_changesSyncRequest;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", changesSyncRequest, CFSTR("changesSyncRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextSyncRequest, CFSTR("contextSyncRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateSyncRequest, CFSTR("stateSyncRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicalIDSyncRequest, CFSTR("medicalIDSyncRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summarySharingSyncRequest, CFSTR("summarySharingSyncRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("requestIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowCellular, CFSTR("allowCellular"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_qualityOfService, CFSTR("qualityOfService"));

}

- (HKCloudSyncRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKCloudSyncRequest *v11;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changesSyncRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextSyncRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateSyncRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicalIDSyncRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summarySharingSyncRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowCellular"));
    self = -[HKCloudSyncRequest initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:](self, "initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v5, v6, v7, v8, v9, v10, v13, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qualityOfService")));

    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v6);
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v13 = (void *)MEMORY[0x1E0CB37A0];
  v3 = objc_opt_class();
  -[HKCloudSyncRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCloudSyncRequest changesSyncRequest](self, "changesSyncRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCloudSyncRequest contextSyncRequest](self, "contextSyncRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCloudSyncRequest stateSyncRequest](self, "stateSyncRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCloudSyncRequest medicalIDSyncRequest](self, "medicalIDSyncRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCloudSyncRequest summarySharingSyncRequest](self, "summarySharingSyncRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@:%p %@\n| Changes Sync Request: %@\n| Context Sync Request: %@\n| State Sync Request: %@\n| Medical ID Sync Request: %@\n| Summary Sharing Sync Request: %@\n| Allow Cellular: %d\n| Quality of Service: %ld\n"), v3, self, v5, v6, v7, v8, v9, v10, -[HKCloudSyncRequest allowCellular](self, "allowCellular"), -[HKCloudSyncRequest qualityOfService](self, "qualityOfService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKChangesSyncRequest)changesSyncRequest
{
  return self->_changesSyncRequest;
}

- (HKContextSyncRequest)contextSyncRequest
{
  return self->_contextSyncRequest;
}

- (HKStateSyncRequest)stateSyncRequest
{
  return self->_stateSyncRequest;
}

- (HKMedicalIDSyncRequest)medicalIDSyncRequest
{
  return self->_medicalIDSyncRequest;
}

- (HKSummarySharingSyncRequest)summarySharingSyncRequest
{
  return self->_summarySharingSyncRequest;
}

- (BOOL)allowCellular
{
  return self->_allowCellular;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySharingSyncRequest, 0);
  objc_storeStrong((id *)&self->_medicalIDSyncRequest, 0);
  objc_storeStrong((id *)&self->_stateSyncRequest, 0);
  objc_storeStrong((id *)&self->_contextSyncRequest, 0);
  objc_storeStrong((id *)&self->_changesSyncRequest, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
