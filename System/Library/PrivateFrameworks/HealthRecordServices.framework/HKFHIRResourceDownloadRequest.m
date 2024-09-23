@implementation HKFHIRResourceDownloadRequest

- (HKFHIRResourceDownloadRequest)initWithResourceType:(id)a3 resourceSchemaDefinition:(id)a4 fullRequestURL:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKFHIRResourceDownloadRequest *v14;
  uint64_t v15;
  NSString *resourceType;
  uint64_t v17;
  NSDictionary *resourceSchemaDefinition;
  uint64_t v19;
  NSURL *fullRequestURL;
  uint64_t v21;
  HKClinicalIngestionContext *context;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFHIRResourceDownloadRequest;
  v14 = -[HKFHIRResourceDownloadRequest init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    resourceType = v14->_resourceType;
    v14->_resourceType = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    resourceSchemaDefinition = v14->_resourceSchemaDefinition;
    v14->_resourceSchemaDefinition = (NSDictionary *)v17;

    v19 = objc_msgSend(v12, "copy");
    fullRequestURL = v14->_fullRequestURL;
    v14->_fullRequestURL = (NSURL *)v19;

    v21 = objc_msgSend(v13, "copy");
    context = v14->_context;
    v14->_context = (HKClinicalIngestionContext *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKFHIRResourceDownloadRequest *v6;
  HKFHIRResourceDownloadRequest *v7;
  HKFHIRResourceDownloadRequest *v8;
  NSString *resourceType;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSDictionary *resourceSchemaDefinition;
  NSDictionary *v16;
  uint64_t v17;
  void *v18;
  NSDictionary *v19;
  NSURL *fullRequestURL;
  NSURL *v21;
  uint64_t v22;
  NSURL *v23;
  uint64_t v24;
  NSURL *v25;
  void *v26;
  HKClinicalIngestionContext *context;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  HKClinicalIngestionContext *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSURL *v40;
  void *v41;
  NSDictionary *v42;
  void *v43;

  v6 = (HKFHIRResourceDownloadRequest *)a3;
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
    resourceType = self->_resourceType;
    -[HKFHIRResourceDownloadRequest resourceType](v8, "resourceType");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (resourceType != v10)
    {
      -[HKFHIRResourceDownloadRequest resourceType](v8, "resourceType");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_resourceType;
      -[HKFHIRResourceDownloadRequest resourceType](v8, "resourceType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    resourceSchemaDefinition = self->_resourceSchemaDefinition;
    -[HKFHIRResourceDownloadRequest resourceSchemaDefinition](v8, "resourceSchemaDefinition");
    v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (resourceSchemaDefinition == v16)
    {
      v42 = resourceSchemaDefinition;
    }
    else
    {
      -[HKFHIRResourceDownloadRequest resourceSchemaDefinition](v8, "resourceSchemaDefinition");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = resourceSchemaDefinition;
      v19 = self->_resourceSchemaDefinition;
      -[HKFHIRResourceDownloadRequest resourceSchemaDefinition](v8, "resourceSchemaDefinition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSDictionary isEqual:](v19, "isEqual:", v4) & 1) == 0)
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    fullRequestURL = self->_fullRequestURL;
    -[HKFHIRResourceDownloadRequest fullRequestURL](v8, "fullRequestURL");
    v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (fullRequestURL == v21)
    {
      v39 = v3;
      v40 = fullRequestURL;
    }
    else
    {
      -[HKFHIRResourceDownloadRequest fullRequestURL](v8, "fullRequestURL");
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
        if (resourceType != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = fullRequestURL;
      v37 = (void *)v22;
      v23 = self->_fullRequestURL;
      -[HKFHIRResourceDownloadRequest fullRequestURL](v8, "fullRequestURL");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if ((-[NSURL isEqual:](v25, "isEqual:", v24) & 1) == 0)
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    context = self->_context;
    -[HKFHIRResourceDownloadRequest context](v8, "context", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = context == (HKClinicalIngestionContext *)v28;
    if (context == (HKClinicalIngestionContext *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKFHIRResourceDownloadRequest context](v8, "context");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_context;
        -[HKFHIRResourceDownloadRequest context](v8, "context");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HKClinicalIngestionContext isEqual:](v32, "isEqual:", v33);

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
  NSString *resourceType;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  resourceType = self->_resourceType;
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, resource type: %@, has full request URL: %@>"), v5, self, resourceType, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *resourceType;
  id v5;

  resourceType = self->_resourceType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resourceType, CFSTR("resourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceSchemaDefinition, CFSTR("resourceSchemaDefinition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fullRequestURL, CFSTR("fullRequestURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));

}

- (HKFHIRResourceDownloadRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  HKFHIRResourceDownloadRequest *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectSecureCodingClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("resourceSchemaDefinition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullRequestURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v12 = 0;
  }
  else
  {
    self = -[HKFHIRResourceDownloadRequest initWithResourceType:resourceSchemaDefinition:fullRequestURL:context:](self, "initWithResourceType:resourceSchemaDefinition:fullRequestURL:context:", v5, v7, v8, v9);
    v12 = self;
  }

  return v12;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSDictionary)resourceSchemaDefinition
{
  return self->_resourceSchemaDefinition;
}

- (NSURL)fullRequestURL
{
  return self->_fullRequestURL;
}

- (HKClinicalIngestionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fullRequestURL, 0);
  objc_storeStrong((id *)&self->_resourceSchemaDefinition, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
}

@end
