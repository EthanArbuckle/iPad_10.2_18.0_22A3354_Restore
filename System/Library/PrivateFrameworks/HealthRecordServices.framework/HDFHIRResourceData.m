@implementation HDFHIRResourceData

- (HDFHIRResourceData)init
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

- (HDFHIRResourceData)initWithData:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDFHIRResourceData *v11;
  uint64_t v12;
  NSData *data;
  uint64_t v14;
  NSURL *sourceURL;
  uint64_t v16;
  HKFHIRVersion *FHIRVersion;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRResourceData;
  v11 = -[HDFHIRResourceData init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v14 = objc_msgSend(v9, "copy");
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    FHIRVersion = v11->_FHIRVersion;
    v11->_FHIRVersion = (HKFHIRVersion *)v16;

  }
  return v11;
}

- (id)JSONDictionaryWithError:(id *)a3
{
  NSData *data;
  void *v5;

  data = self->_data;
  if (data)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectFromFHIRData:options:error:", data, 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 3, CFSTR("nil data provided"));
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("Data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceURL, CFSTR("SourceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FHIRVersion, CFSTR("FHIRVersion"));

}

- (HDFHIRResourceData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  HDFHIRResourceData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }
  else
  {
    self = -[HDFHIRResourceData initWithData:sourceURL:FHIRVersion:](self, "initWithData:sourceURL:FHIRVersion:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_data, "hash");
  v4 = -[NSURL hash](self->_sourceURL, "hash") ^ v3;
  return v4 ^ -[HKFHIRVersion hash](self->_FHIRVersion, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HDFHIRResourceData *v4;
  HDFHIRResourceData *v5;
  NSData *data;
  NSData *v7;
  uint64_t v8;
  void *v9;
  NSData *v10;
  void *v11;
  void *v12;
  NSURL *sourceURL;
  NSURL *v14;
  NSURL *v15;
  void *v16;
  HKFHIRVersion *FHIRVersion;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (HDFHIRResourceData *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      data = self->_data;
      -[HDFHIRResourceData data](v5, "data");
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (data != v7)
      {
        -[HDFHIRResourceData data](v5, "data");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        v9 = (void *)v8;
        v10 = self->_data;
        -[HDFHIRResourceData data](v5, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSData isEqual:](v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      sourceURL = self->_sourceURL;
      -[HDFHIRResourceData sourceURL](v5, "sourceURL");
      v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
      if (sourceURL != v14)
      {
        -[HDFHIRResourceData sourceURL](v5, "sourceURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v15 = self->_sourceURL;
        -[HDFHIRResourceData sourceURL](v5, "sourceURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSURL isEqual:](v15, "isEqual:", v16) & 1) == 0)
        {

          LOBYTE(v12) = 0;
LABEL_27:
          v23 = data == v7;
          v9 = v28;
LABEL_28:
          v11 = v29;
          if (!v23)
            goto LABEL_29;
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      FHIRVersion = self->_FHIRVersion;
      -[HDFHIRResourceData FHIRVersion](v5, "FHIRVersion", v25);
      v18 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = FHIRVersion == (HKFHIRVersion *)v18;
      if (FHIRVersion == (HKFHIRVersion *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        -[HDFHIRResourceData FHIRVersion](v5, "FHIRVersion");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v12 = self->_FHIRVersion;
          -[HDFHIRResourceData FHIRVersion](v5, "FHIRVersion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "isEqual:", v22);

          if (sourceURL == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }

      }
      if (sourceURL == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      v9 = v28;

      v23 = data == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_data, 4);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p; source URL: \"%@\", string data: \"%@\">"), v6, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (void)setFHIRVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
