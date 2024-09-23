@implementation HMCharacteristicMetadata

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("[%@"));
  -[HMCharacteristicMetadata format](self, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMCharacteristicMetadata format](self, "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%@"), CFSTR(" "), CFSTR("Format: "), v5);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  -[HMCharacteristicMetadata units](self, "units");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    ++v6;
    if (v4)
      v8 = CFSTR(", ");
    else
      v8 = CFSTR(" ");
    -[HMCharacteristicMetadata units](self, "units");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%@"), v8, CFSTR("Units: "), v9);

  }
  -[HMCharacteristicMetadata minimumValue](self, "minimumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v6 + 1;
    if (v6)
      v12 = CFSTR(", ");
    else
      v12 = CFSTR(" ");
    -[HMCharacteristicMetadata minimumValue](self, "minimumValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v12, CFSTR("Min: "), v14);

    v6 = v11;
  }
  -[HMCharacteristicMetadata maximumValue](self, "maximumValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = v6 + 1;
    if (v6)
      v17 = CFSTR(", ");
    else
      v17 = CFSTR(" ");
    -[HMCharacteristicMetadata maximumValue](self, "maximumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v17, CFSTR("Max: "), v19);

    v6 = v16;
  }
  -[HMCharacteristicMetadata stepValue](self, "stepValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = v6 + 1;
    if (v6)
      v22 = CFSTR(", ");
    else
      v22 = CFSTR(" ");
    -[HMCharacteristicMetadata stepValue](self, "stepValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v22, CFSTR("Step: "), v24);

    v6 = v21;
  }
  -[HMCharacteristicMetadata maxLength](self, "maxLength");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = v6 + 1;
    if (v6)
      v27 = CFSTR(", ");
    else
      v27 = CFSTR(" ");
    -[HMCharacteristicMetadata maxLength](self, "maxLength");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%u"), v27, CFSTR("Max length: "), objc_msgSend(v28, "unsignedIntValue"));

    v6 = v26;
  }
  -[HMCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if (v6)
      v30 = CFSTR(", ");
    else
      v30 = CFSTR(" ");
    -[HMCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%@"), v30, CFSTR("Manufacturer Description: "), v31);

    v6 = 1;
  }
  -[HMCharacteristicMetadata validValues](self, "validValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    if (v6)
      v34 = CFSTR(", ");
    else
      v34 = CFSTR(" ");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v34, CFSTR("Valid Values: "));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[HMCharacteristicMetadata validValues](self, "validValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v42 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v37);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  return (NSString *)v3;
}

- (NSString)format
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_format;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)minimumValue
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_minimumValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maximumValue
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_maximumValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)stepValue
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_stepValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)manufacturerDescription
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_manufacturerDescription;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)units
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_units;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)validValues
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_validValues;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)maxLength
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_maxLength;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMCharacteristicMetadata)initWithCoder:(id)a3
{
  id v4;
  HMCharacteristicMetadata *v5;
  uint64_t v6;
  NSNumber *minimumValue;
  uint64_t v8;
  NSNumber *maximumValue;
  uint64_t v10;
  NSNumber *stepValue;
  uint64_t v12;
  NSNumber *maxLength;
  uint64_t v14;
  NSString *format;
  uint64_t v16;
  NSString *units;
  uint64_t v18;
  NSString *manufacturerDescription;
  uint64_t v20;
  NSArray *validValues;

  v4 = a3;
  v5 = -[HMCharacteristicMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMinimumValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMaximumValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataStepValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    stepValue = v5->_stepValue;
    v5->_stepValue = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMaxLength"));
    v12 = objc_claimAutoreleasedReturnValue();
    maxLength = v5->_maxLength;
    v5->_maxLength = (NSNumber *)v12;

    objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("metadataFormat"));
    v14 = objc_claimAutoreleasedReturnValue();
    format = v5->_format;
    v5->_format = (NSString *)v14;

    objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("metadataUnits"));
    v16 = objc_claimAutoreleasedReturnValue();
    units = v5->_units;
    v5->_units = (NSString *)v16;

    objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", CFSTR("metadataUserDescription"));
    v18 = objc_claimAutoreleasedReturnValue();
    manufacturerDescription = v5->_manufacturerDescription;
    v5->_manufacturerDescription = (NSString *)v18;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("metadataValidValues"));
    v20 = objc_claimAutoreleasedReturnValue();
    validValues = v5->_validValues;
    v5->_validValues = (NSArray *)v20;

  }
  return v5;
}

- (HMCharacteristicMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCharacteristicMetadata;
  return -[HMCharacteristicMetadata init](&v3, sel_init);
}

- (void)setMinimumValue:(id)a3
{
  NSNumber *v4;
  NSNumber *minimumValue;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  minimumValue = self->_minimumValue;
  self->_minimumValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaximumValue:(id)a3
{
  NSNumber *v4;
  NSNumber *maximumValue;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maximumValue = self->_maximumValue;
  self->_maximumValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setStepValue:(id)a3
{
  NSNumber *v4;
  NSNumber *stepValue;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  stepValue = self->_stepValue;
  self->_stepValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxLength:(id)a3
{
  NSNumber *v4;
  NSNumber *maxLength;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  maxLength = self->_maxLength;
  self->_maxLength = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFormat:(id)a3
{
  NSString *v4;
  NSString *format;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  format = self->_format;
  self->_format = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setUnits:(id)a3
{
  NSString *v4;
  NSString *units;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  units = self->_units;
  self->_units = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setManufacturerDescription:(id)a3
{
  NSString *v4;
  NSString *manufacturerDescription;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturerDescription = self->_manufacturerDescription;
  self->_manufacturerDescription = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setValidValues:(id)a3
{
  NSArray *v4;
  NSArray *validValues;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  validValues = self->_validValues;
  self->_validValues = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[HMCharacteristicMetadata minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = HMFEqualObjects();
    v9 = v8 ^ 1;

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "minimumValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setMinimumValue:](self, "setMinimumValue:", v10);

    }
    -[HMCharacteristicMetadata maximumValue](self, "maximumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v5, "maximumValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setMaximumValue:](self, "setMaximumValue:", v14);

      v9 = 1;
    }
    -[HMCharacteristicMetadata stepValue](self, "stepValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stepValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if ((v17 & 1) == 0)
    {
      objc_msgSend(v5, "stepValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setStepValue:](self, "setStepValue:", v18);

      v9 = 1;
    }
    -[HMCharacteristicMetadata maxLength](self, "maxLength");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxLength");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v5, "maxLength");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setMaxLength:](self, "setMaxLength:", v22);

      v9 = 1;
    }
    -[HMCharacteristicMetadata format](self, "format");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "format");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = HMFEqualObjects();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v5, "format");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setFormat:](self, "setFormat:", v26);

      v9 = 1;
    }
    -[HMCharacteristicMetadata units](self, "units");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "units");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = HMFEqualObjects();

    if ((v29 & 1) == 0)
    {
      objc_msgSend(v5, "units");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setUnits:](self, "setUnits:", v30);

      v9 = 1;
    }
    -[HMCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manufacturerDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = HMFEqualObjects();

    if ((v33 & 1) == 0)
    {
      objc_msgSend(v5, "manufacturerDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setManufacturerDescription:](self, "setManufacturerDescription:", v34);

      v9 = 1;
    }
    -[HMCharacteristicMetadata validValues](self, "validValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "validValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = HMFEqualObjects();

    if ((v37 & 1) == 0)
    {
      objc_msgSend(v5, "validValues");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicMetadata setValidValues:](self, "setValidValues:", v38);

      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)uniqueIdentifier
{
  return 0;
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
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[HMCharacteristicMetadata minimumValue](self, "minimumValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMCharacteristicMetadata maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMCharacteristicMetadata stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMCharacteristicMetadata maxLength](self, "maxLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMCharacteristicMetadata format](self, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[HMCharacteristicMetadata units](self, "units");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  -[HMCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  -[HMCharacteristicMetadata validValues](self, "validValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMCharacteristicMetadata *v4;
  HMCharacteristicMetadata *v5;
  HMCharacteristicMetadata *v6;
  HMCharacteristicMetadata *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  char v23;

  v4 = (HMCharacteristicMetadata *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (!v6)
      goto LABEL_14;
    -[HMCharacteristicMetadata minimumValue](v6, "minimumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_14;
    -[HMCharacteristicMetadata maximumValue](v7, "maximumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_14;
    -[HMCharacteristicMetadata stepValue](v7, "stepValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (!v13)
      goto LABEL_14;
    -[HMCharacteristicMetadata maxLength](v7, "maxLength");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if (!v15)
      goto LABEL_14;
    -[HMCharacteristicMetadata format](v7, "format");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if (!v17)
      goto LABEL_14;
    -[HMCharacteristicMetadata units](v7, "units");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if (!v19)
      goto LABEL_14;
    -[HMCharacteristicMetadata manufacturerDescription](v7, "manufacturerDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if (v21)
    {
      -[HMCharacteristicMetadata validValues](v7, "validValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = HMFEqualObjects();

    }
    else
    {
LABEL_14:
      v23 = 0;
    }

  }
  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_manufacturerDescription, 0);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
