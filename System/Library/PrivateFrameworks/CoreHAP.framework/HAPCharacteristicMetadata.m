@implementation HAPCharacteristicMetadata

- (id)_generateValidConstraints:(id)a3
{
  HAPMetadataConstraints *v4;
  void *v5;
  int v6;
  HAPMetadataConstraints *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPMetadataConstraints *v11;
  void *v13;
  uint64_t v14;

  v4 = (HAPMetadataConstraints *)a3;
  -[HAPCharacteristicMetadata format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("string"));

  v7 = v4;
  if (v6)
  {
    v7 = v4;
    if (!v4)
      v7 = objc_alloc_init(HAPMetadataConstraints);
    -[HAPMetadataConstraints maxLength](v7, "maxLength");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 64);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMetadataConstraints setMaxLength:](v7, "setMaxLength:", v9);

    }
  }
  -[HAPMetadataConstraints minimumValue](v7, "minimumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_11;
  -[HAPMetadataConstraints maximumValue](v7, "maximumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[HAPMetadataConstraints stepValue](v7, "stepValue"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[HAPMetadataConstraints minLength](v7, "minLength"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[HAPMetadataConstraints maxLength](v7, "maxLength"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_11:

  }
  else
  {
    -[HAPMetadataConstraints validValues](v7, "validValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      v11 = 0;
      goto LABEL_13;
    }
  }
  v11 = v7;
LABEL_13:

  return v11;
}

- (HAPCharacteristicMetadata)initWithConstraints:(id)a3 description:(id)a4 format:(id)a5 units:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HAPCharacteristicMetadata *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  HAPCharacteristicMetadata *v28;
  HAPCharacteristicMetadata *v29;
  uint64_t v30;
  HAPMetadataConstraints *constraints;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10 || v11 || v12 || v13)
  {
    v16 = v10;
    objc_msgSend(v16, "maxLength");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_14;
    v18 = (void *)v17;
    objc_msgSend(v16, "maxLength");
    v34 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    v20 = objc_msgSend(v19, "unsignedIntValue");

    v11 = v34;
    v21 = v20 >= 0x101;
    v14 = v33;
    if (v21)
    {
      v22 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v24;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@### Value of maxLength exceeds maximum allowed value", buf, 0xCu);

        v11 = v34;
      }

      objc_autoreleasePoolPop(v22);
      v25 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v27;
        _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize metadata because of invalid arguments", buf, 0xCu);

        v11 = v34;
      }

      objc_autoreleasePoolPop(v25);
      v15 = 0;
      v14 = v33;
    }
    else
    {
LABEL_14:

      v35.receiver = self;
      v35.super_class = (Class)HAPCharacteristicMetadata;
      v28 = -[HAPCharacteristicMetadata init](&v35, sel_init);
      v29 = v28;
      if (v28)
      {
        objc_storeStrong((id *)&v28->_manufacturerDescription, a4);
        objc_storeStrong((id *)&v29->_format, a5);
        objc_storeStrong((id *)&v29->_units, a6);
        -[HAPCharacteristicMetadata _generateValidConstraints:](v29, "_generateValidConstraints:", v16);
        v30 = objc_claimAutoreleasedReturnValue();
        constraints = v29->_constraints;
        v29->_constraints = (HAPMetadataConstraints *)v30;

      }
      self = v29;
      v15 = self;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[HAPCharacteristicMetadata constraints](self, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[1];
    v5[1] = v7;

    -[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    -[HAPCharacteristicMetadata format](self, "format");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[3];
    v5[3] = v13;

    -[HAPCharacteristicMetadata units](self, "units");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = (void *)v5[4];
    v5[4] = v16;

  }
  return v5;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)units
{
  return self->_units;
}

- (NSString)manufacturerDescription
{
  return self->_manufacturerDescription;
}

- (HAPMetadataConstraints)constraints
{
  return self->_constraints;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10.receiver = self;
  v10.super_class = (Class)HAPCharacteristicMetadata;
  -[HMFObject description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@  "), v4);

  -[HAPCharacteristicMetadata constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Constraints: %@  "), v5);

  -[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Description: %@  "), v6);

  -[HAPCharacteristicMetadata format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Format: %@  "), v7);

  -[HAPCharacteristicMetadata units](self, "units");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Units: %@  "), v8);

  return v3;
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
  unint64_t v10;

  -[HAPCharacteristicMetadata constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HAPCharacteristicMetadata format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HAPCharacteristicMetadata units](self, "units");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqualToCharacteristicMetadata:(id)a3
{
  HAPCharacteristicMetadata *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (HAPCharacteristicMetadata *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    -[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicMetadata manufacturerDescription](v4, "manufacturerDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 | v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend((id)v5, "isEqualToString:", v6);

      if (!v8)
        goto LABEL_11;
    }
    -[HAPCharacteristicMetadata format](self, "format");
    v10 = objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicMetadata format](v4, "format");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 | v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend((id)v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_11;
    }
    -[HAPCharacteristicMetadata units](self, "units");
    v14 = objc_claimAutoreleasedReturnValue();
    -[HAPCharacteristicMetadata units](v4, "units");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!(v14 | v15)
      || (v16 = (void *)v15,
          v17 = objc_msgSend((id)v14, "isEqualToString:", v15),
          v16,
          (id)v14,
          v17))
    {
      -[HAPCharacteristicMetadata constraints](self, "constraints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicMetadata constraints](v4, "constraints");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {
        v9 = 1;
        v20 = v18;
      }
      else
      {
        v20 = (void *)v19;
        -[HAPCharacteristicMetadata constraints](self, "constraints");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicMetadata constraints](v4, "constraints");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v21, "isEqualToMetadataConstraints:", v22);

      }
    }
    else
    {
LABEL_11:
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HAPCharacteristicMetadata constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MC"));

  -[HAPCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MD"));

  -[HAPCharacteristicMetadata format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("MF"));

  -[HAPCharacteristicMetadata units](self, "units");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("MU"));

}

- (HAPCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4;
  HAPCharacteristicMetadata *v5;
  uint64_t v6;
  HAPMetadataConstraints *constraints;
  uint64_t v8;
  NSString *manufacturerDescription;
  uint64_t v10;
  NSString *format;
  uint64_t v12;
  NSString *units;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicMetadata;
  v5 = -[HAPCharacteristicMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MC"));
    v6 = objc_claimAutoreleasedReturnValue();
    constraints = v5->_constraints;
    v5->_constraints = (HAPMetadataConstraints *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MD"));
    v8 = objc_claimAutoreleasedReturnValue();
    manufacturerDescription = v5->_manufacturerDescription;
    v5->_manufacturerDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MF"));
    v10 = objc_claimAutoreleasedReturnValue();
    format = v5->_format;
    v5->_format = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MU"));
    v12 = objc_claimAutoreleasedReturnValue();
    units = v5->_units;
    v5->_units = (NSString *)v12;

  }
  return v5;
}

- (void)setManufacturerDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
