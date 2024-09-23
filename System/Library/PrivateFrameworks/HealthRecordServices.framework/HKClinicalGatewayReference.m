@implementation HKClinicalGatewayReference

- (HKClinicalGatewayReference)init
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

- (HKClinicalGatewayReference)initWithGatewayID:(id)a3 gatewayBatchID:(id)a4 minCompatibleAPIVersion:(int64_t)a5 FHIRVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKClinicalGatewayReference *v13;
  uint64_t v14;
  NSString *gatewayID;
  uint64_t v16;
  NSString *gatewayBatchID;
  uint64_t v18;
  HKFHIRVersion *FHIRVersion;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalGatewayReference;
  v13 = -[HKClinicalGatewayReference init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    gatewayID = v13->_gatewayID;
    v13->_gatewayID = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    gatewayBatchID = v13->_gatewayBatchID;
    v13->_gatewayBatchID = (NSString *)v16;

    v13->_minCompatibleAPIVersion = a5;
    v18 = objc_msgSend(v12, "copy");
    FHIRVersion = v13->_FHIRVersion;
    v13->_FHIRVersion = (HKFHIRVersion *)v18;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalGatewayReference *v6;
  HKClinicalGatewayReference *v7;
  HKClinicalGatewayReference *v8;
  NSString *gatewayID;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSString *gatewayBatchID;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  int64_t v22;
  int64_t minCompatibleAPIVersion;
  HKFHIRVersion *FHIRVersion;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HKFHIRVersion *v29;
  BOOL v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = (HKClinicalGatewayReference *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    gatewayID = self->_gatewayID;
    -[HKClinicalGatewayReference gatewayID](v8, "gatewayID");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (gatewayID != v10)
    {
      -[HKClinicalGatewayReference gatewayID](v8, "gatewayID");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_29;
      }
      v4 = (void *)v11;
      v12 = self->_gatewayID;
      -[HKClinicalGatewayReference gatewayID](v8, "gatewayID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
      {
        v14 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v35 = v13;
    }
    gatewayBatchID = self->_gatewayBatchID;
    -[HKClinicalGatewayReference gatewayBatchID](v8, "gatewayBatchID");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (gatewayBatchID == v16)
    {
      minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
      if (minCompatibleAPIVersion == -[HKClinicalGatewayReference minCompatibleAPIVersion](v8, "minCompatibleAPIVersion"))goto LABEL_16;
    }
    else
    {
      -[HKClinicalGatewayReference gatewayBatchID](v8, "gatewayBatchID");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v3 = (void *)v17;
        v18 = self->_gatewayBatchID;
        -[HKClinicalGatewayReference gatewayBatchID](v8, "gatewayBatchID");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = (void *)v19;
        if (!-[NSString isEqualToString:](v20, "isEqualToString:", v19))
        {

          v14 = 0;
          v30 = gatewayID == v10;
          goto LABEL_34;
        }
        v33 = v21;
        v22 = self->_minCompatibleAPIVersion;
        if (v22 != -[HKClinicalGatewayReference minCompatibleAPIVersion](v8, "minCompatibleAPIVersion"))
        {
          v14 = 0;
          v13 = v35;
LABEL_26:

LABEL_27:
          if (gatewayID != v10)
            goto LABEL_28;
LABEL_29:

          goto LABEL_30;
        }
LABEL_16:
        v34 = v4;
        FHIRVersion = self->_FHIRVersion;
        -[HKClinicalGatewayReference FHIRVersion](v8, "FHIRVersion");
        v25 = objc_claimAutoreleasedReturnValue();
        if (FHIRVersion == (HKFHIRVersion *)v25)
        {

          v14 = 1;
        }
        else
        {
          v26 = (void *)v25;
          -[HKClinicalGatewayReference FHIRVersion](v8, "FHIRVersion");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = (void *)v27;
            v29 = self->_FHIRVersion;
            -[HKClinicalGatewayReference FHIRVersion](v8, "FHIRVersion");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[HKFHIRVersion isEqual:](v29, "isEqual:", v32);

            if (gatewayBatchID == v16)
            {

            }
            else
            {

            }
            v30 = gatewayID == v10;
            v4 = v34;
LABEL_34:
            v13 = v35;
            if (v30)
              goto LABEL_29;
            goto LABEL_28;
          }

          v14 = 0;
        }
        v30 = gatewayBatchID == v16;
        v4 = v34;
        v13 = v35;
        if (v30)
          goto LABEL_27;
        goto LABEL_26;
      }
    }
    v14 = 0;
    v13 = v35;
    goto LABEL_27;
  }
  v14 = 1;
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  int64_t minCompatibleAPIVersion;

  v3 = -[NSString hash](self->_gatewayID, "hash");
  v4 = -[NSString hash](self->_gatewayBatchID, "hash") ^ v3;
  minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
  return v4 ^ minCompatibleAPIVersion ^ -[HKFHIRVersion hash](self->_FHIRVersion, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *gatewayID;
  id v5;

  gatewayID = self->_gatewayID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", gatewayID, CFSTR("gatewayID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gatewayBatchID, CFSTR("gatewayBatchID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minCompatibleAPIVersion, CFSTR("minCompatibleAPIVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FHIRVersion, CFSTR("FHIRVersion"));

}

- (HKClinicalGatewayReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HKClinicalGatewayReference *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gatewayID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gatewayBatchID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_msgSend(v4, "containsValueForKey:", CFSTR("minCompatibleAPIVersion")) & 1) != 0)
    {
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minCompatibleAPIVersion"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FHIRVersion"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self = -[HKClinicalGatewayReference initWithGatewayID:gatewayBatchID:minCompatibleAPIVersion:FHIRVersion:](self, "initWithGatewayID:gatewayBatchID:minCompatibleAPIVersion:FHIRVersion:", v5, v6, v7, v8);
        v9 = self;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v9 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSString)gatewayID
{
  return self->_gatewayID;
}

- (NSString)gatewayBatchID
{
  return self->_gatewayBatchID;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewayBatchID, 0);
  objc_storeStrong((id *)&self->_gatewayID, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
}

@end
