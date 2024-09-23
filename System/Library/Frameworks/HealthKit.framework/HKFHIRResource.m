@implementation HKFHIRResource

- (HKFHIRResource)init
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

- (HKFHIRResource)initWithResourceType:(id)a3 identifier:(id)a4 FHIRVersion:(id)a5 data:(id)a6 sourceURL:(id)a7 lastUpdatedDate:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKFHIRResource *v21;
  uint64_t v22;
  HKFHIRVersion *FHIRVersion;
  uint64_t v24;
  NSString *resourceType;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSData *data;
  uint64_t v30;
  NSURL *sourceURL;
  uint64_t v32;
  NSDate *lastUpdatedDate;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v17)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRResource.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("FHIRVersion"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRResource.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resourceType"));

  if (v16)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRResource.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v20)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRResource.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v18)
    goto LABEL_12;
LABEL_5:
  if (v20)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRResource.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastUpdatedDate"));

LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)HKFHIRResource;
  v21 = -[HKFHIRResource init](&v40, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v17, "copy");
    FHIRVersion = v21->_FHIRVersion;
    v21->_FHIRVersion = (HKFHIRVersion *)v22;

    v24 = objc_msgSend(v15, "copy");
    resourceType = v21->_resourceType;
    v21->_resourceType = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    data = v21->_data;
    v21->_data = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    sourceURL = v21->_sourceURL;
    v21->_sourceURL = (NSURL *)v30;

    v32 = objc_msgSend(v20, "copy");
    lastUpdatedDate = v21->_lastUpdatedDate;
    v21->_lastUpdatedDate = (NSDate *)v32;

  }
  return v21;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (HKFHIRResourceType)resourceType
{
  return self->_resourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)data
{
  return self->_data;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSString)sourceString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[HKFHIRResource data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_stringForDisplayFromFHIRData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
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
  unint64_t v14;

  -[HKFHIRResource resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKFHIRResource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HKFHIRResource FHIRVersion](self, "FHIRVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HKFHIRResource data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HKFHIRResource sourceURL](self, "sourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[HKFHIRResource lastUpdatedDate](self, "lastUpdatedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HKFHIRResource *v4;
  HKFHIRResource *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;

  v4 = (HKFHIRResource *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKFHIRResource FHIRVersion](self, "FHIRVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource FHIRVersion](v5, "FHIRVersion");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKFHIRResource FHIRVersion](v5, "FHIRVersion");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_34;
        v10 = (void *)v9;
        -[HKFHIRResource FHIRVersion](self, "FHIRVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource FHIRVersion](v5, "FHIRVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_35;
      }
      -[HKFHIRResource resourceType](self, "resourceType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource resourceType](v5, "resourceType");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKFHIRResource resourceType](v5, "resourceType");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_34;
        v17 = (void *)v16;
        -[HKFHIRResource resourceType](self, "resourceType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource resourceType](v5, "resourceType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_35;
      }
      -[HKFHIRResource identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource identifier](v5, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HKFHIRResource identifier](v5, "identifier");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_34;
        v23 = (void *)v22;
        -[HKFHIRResource identifier](self, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource identifier](v5, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_35;
      }
      -[HKFHIRResource data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource data](v5, "data");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v27)
      {

      }
      else
      {
        v8 = (void *)v27;
        -[HKFHIRResource data](v5, "data");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_34;
        v29 = (void *)v28;
        -[HKFHIRResource data](self, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource data](v5, "data");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

        if (!v32)
          goto LABEL_35;
      }
      -[HKFHIRResource sourceURL](self, "sourceURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource sourceURL](v5, "sourceURL");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v33)
      {

      }
      else
      {
        v8 = (void *)v33;
        -[HKFHIRResource sourceURL](v5, "sourceURL");
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_34;
        v35 = (void *)v34;
        -[HKFHIRResource sourceURL](self, "sourceURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource sourceURL](v5, "sourceURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if (!v38)
          goto LABEL_35;
      }
      -[HKFHIRResource lastUpdatedDate](self, "lastUpdatedDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRResource lastUpdatedDate](v5, "lastUpdatedDate");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v39)
      {

LABEL_39:
        v14 = 1;
        goto LABEL_36;
      }
      v8 = (void *)v39;
      -[HKFHIRResource lastUpdatedDate](v5, "lastUpdatedDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = (void *)v40;
        -[HKFHIRResource lastUpdatedDate](self, "lastUpdatedDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRResource lastUpdatedDate](v5, "lastUpdatedDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "isEqual:", v43);

        if ((v44 & 1) != 0)
          goto LABEL_39;
LABEL_35:
        v14 = 0;
LABEL_36:

        goto LABEL_37;
      }
LABEL_34:

      goto LABEL_35;
    }
    v14 = 0;
  }
LABEL_37:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRResource)initWithCoder:(id)a3
{
  id v4;
  HKFHIRVersion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKFHIRResource *v10;
  void *v11;
  void *v12;
  __int128 v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
  v5 = (HKFHIRVersion *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v14 = xmmword_19A44C600;
    v15 = 2;
    v5 = -[HKFHIRVersion initWithSemanticVersion:]([HKFHIRVersion alloc], "initWithSemanticVersion:", &v14);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResourceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (HKFHIRResource *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_8;
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("LastUpdatedDate"));
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[HKFHIRResource initWithResourceType:identifier:FHIRVersion:data:sourceURL:lastUpdatedDate:](self, "initWithResourceType:identifier:FHIRVersion:data:sourceURL:lastUpdatedDate:", v6, v7, v5, v8, v10, v12);

  v10 = self;
LABEL_8:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HKFHIRResource FHIRVersion](self, "FHIRVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("FHIRVersion"));

  -[HKFHIRResource resourceType](self, "resourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("ResourceType"));

  -[HKFHIRResource identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("Identifier"));

  -[HKFHIRResource data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("Data"));

  -[HKFHIRResource sourceURL](self, "sourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HKFHIRResource sourceURL](self, "sourceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("SourceURL"));

  }
  -[HKFHIRResource lastUpdatedDate](self, "lastUpdatedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  objc_msgSend(v12, "encodeDouble:forKey:", CFSTR("LastUpdatedDate"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
}

@end
