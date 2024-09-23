@implementation HKFHIRResourceDownloadRequestResult

- (HKFHIRResourceDownloadRequestResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKFHIRResourceDownloadRequestResult)initWithResourceBundleData:(id)a3 endStates:(id)a4 refreshResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKFHIRResourceDownloadRequestResult *v11;
  uint64_t v12;
  NSData *resourceBundleData;
  uint64_t v14;
  HKFHIRRequestTaskEndStates *endStates;
  uint64_t v16;
  HKFHIRCredentialRefreshResult *refreshResult;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRResourceDownloadRequestResult;
  v11 = -[HKFHIRResourceDownloadRequestResult init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    resourceBundleData = v11->_resourceBundleData;
    v11->_resourceBundleData = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    endStates = v11->_endStates;
    v11->_endStates = (HKFHIRRequestTaskEndStates *)v14;

    v16 = objc_msgSend(v10, "copy");
    refreshResult = v11->_refreshResult;
    v11->_refreshResult = (HKFHIRCredentialRefreshResult *)v16;

  }
  return v11;
}

- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3
{
  return -[HKFHIRResourceDownloadRequestResult initWithError:endStates:refreshResult:](self, "initWithError:endStates:refreshResult:", a3, 0, 0);
}

- (HKFHIRResourceDownloadRequestResult)initWithError:(id)a3 endStates:(id)a4 refreshResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKFHIRResourceDownloadRequestResult *v11;
  uint64_t v12;
  NSError *error;
  uint64_t v14;
  HKFHIRRequestTaskEndStates *endStates;
  uint64_t v16;
  HKFHIRCredentialRefreshResult *refreshResult;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRResourceDownloadRequestResult;
  v11 = -[HKFHIRResourceDownloadRequestResult init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    error = v11->_error;
    v11->_error = (NSError *)v12;

    v14 = objc_msgSend(v9, "copy");
    endStates = v11->_endStates;
    v11->_endStates = (HKFHIRRequestTaskEndStates *)v14;

    v16 = objc_msgSend(v10, "copy");
    refreshResult = v11->_refreshResult;
    v11->_refreshResult = (HKFHIRCredentialRefreshResult *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKFHIRResourceDownloadRequestResult *v6;
  HKFHIRResourceDownloadRequestResult *v7;
  HKFHIRResourceDownloadRequestResult *v8;
  NSData *resourceBundleData;
  NSData *v10;
  uint64_t v11;
  NSData *v12;
  void *v13;
  char v14;
  HKFHIRRequestTaskEndStates *endStates;
  HKFHIRRequestTaskEndStates *v16;
  uint64_t v17;
  void *v18;
  HKFHIRRequestTaskEndStates *v19;
  HKFHIRCredentialRefreshResult *refreshResult;
  HKFHIRCredentialRefreshResult *v21;
  uint64_t v22;
  HKFHIRCredentialRefreshResult *v23;
  uint64_t v24;
  HKFHIRCredentialRefreshResult *v25;
  void *v26;
  NSError *error;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSError *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HKFHIRCredentialRefreshResult *v40;
  void *v41;
  HKFHIRRequestTaskEndStates *v42;
  void *v43;

  v6 = (HKFHIRResourceDownloadRequestResult *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    resourceBundleData = self->_resourceBundleData;
    -[HKFHIRResourceDownloadRequestResult resourceBundleData](v8, "resourceBundleData");
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (resourceBundleData != v10)
    {
      -[HKFHIRResourceDownloadRequestResult resourceBundleData](v8, "resourceBundleData");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_resourceBundleData;
      -[HKFHIRResourceDownloadRequestResult resourceBundleData](v8, "resourceBundleData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSData isEqual:](v12, "isEqual:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    endStates = self->_endStates;
    -[HKFHIRResourceDownloadRequestResult endStates](v8, "endStates");
    v16 = (HKFHIRRequestTaskEndStates *)objc_claimAutoreleasedReturnValue();
    if (endStates == v16)
    {
      v42 = endStates;
    }
    else
    {
      -[HKFHIRResourceDownloadRequestResult endStates](v8, "endStates");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = endStates;
      v19 = self->_endStates;
      -[HKFHIRResourceDownloadRequestResult endStates](v8, "endStates");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKFHIRRequestTaskEndStates isEqual:](v19, "isEqual:", v4))
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    refreshResult = self->_refreshResult;
    -[HKFHIRResourceDownloadRequestResult refreshResult](v8, "refreshResult");
    v21 = (HKFHIRCredentialRefreshResult *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (refreshResult == v21)
    {
      v39 = v3;
      v40 = refreshResult;
    }
    else
    {
      -[HKFHIRResourceDownloadRequestResult refreshResult](v8, "refreshResult");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:

        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (resourceBundleData != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = refreshResult;
      v37 = (void *)v22;
      v23 = self->_refreshResult;
      -[HKFHIRResourceDownloadRequestResult refreshResult](v8, "refreshResult");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if (!-[HKFHIRCredentialRefreshResult isEqual:](v25, "isEqual:", v24))
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    error = self->_error;
    -[HKFHIRResourceDownloadRequestResult error](v8, "error", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = error == (NSError *)v28;
    if (error == (NSError *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKFHIRResourceDownloadRequestResult error](v8, "error");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_error;
        -[HKFHIRResourceDownloadRequestResult error](v8, "error");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSError isEqual:](v32, "isEqual:", v33);

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16)
            goto LABEL_36;
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }

    }
    if (v40 == v21)
      goto LABEL_42;

    v3 = v39;
    goto LABEL_33;
  }
  v14 = 1;
LABEL_41:

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)-[NSData length](self->_resourceBundleData, "length") * 0.0009765625;
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, resource bundle data: %.2f KB, did refresh token: %@ error: %@>"), v5, self, *(_QWORD *)&v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *resourceBundleData;
  id v5;

  resourceBundleData = self->_resourceBundleData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resourceBundleData, CFSTR("resourceBundleData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endStates, CFSTR("endStates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshResult, CFSTR("refreshResult"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (HKFHIRResourceDownloadRequestResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKFHIRResourceDownloadRequestResult *v9;
  HKFHIRResourceDownloadRequestResult *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceBundleData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = -[HKFHIRResourceDownloadRequestResult initWithResourceBundleData:endStates:refreshResult:](self, "initWithResourceBundleData:endStates:refreshResult:", v5, v8, v7);
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
      v10 = 0;
      goto LABEL_6;
    }
    v9 = -[HKFHIRResourceDownloadRequestResult initWithError:endStates:refreshResult:](self, "initWithError:endStates:refreshResult:", v6, v8, v7);
  }
  self = v9;
  v10 = self;
LABEL_6:

  return v10;
}

- (NSData)resourceBundleData
{
  return self->_resourceBundleData;
}

- (HKFHIRRequestTaskEndStates)endStates
{
  return self->_endStates;
}

- (HKFHIRCredentialRefreshResult)refreshResult
{
  return self->_refreshResult;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_refreshResult, 0);
  objc_storeStrong((id *)&self->_endStates, 0);
  objc_storeStrong((id *)&self->_resourceBundleData, 0);
}

@end
