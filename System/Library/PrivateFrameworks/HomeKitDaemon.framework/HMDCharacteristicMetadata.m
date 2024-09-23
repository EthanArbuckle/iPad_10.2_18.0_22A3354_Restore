@implementation HMDCharacteristicMetadata

- (HMDCharacteristicMetadata)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCharacteristicMetadata)initWithMinimumValue:(id)a3 maximumValue:(id)a4 stepValue:(id)a5 maxLength:(id)a6 validValues:(id)a7 format:(id)a8 units:(id)a9 manufacturerDescription:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  HMDCharacteristicMetadata *v21;
  HMDCharacteristicMetadata *v22;
  uint64_t v23;
  NSString *format;
  uint64_t v25;
  NSString *units;
  uint64_t v27;
  NSString *manufacturerDescription;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v31 = a5;
  v30 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDCharacteristicMetadata;
  v21 = -[HMDCharacteristicMetadata init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_minimumValue, a3);
    objc_storeStrong((id *)&v22->_maximumValue, a4);
    objc_storeStrong((id *)&v22->_stepValue, a5);
    objc_storeStrong((id *)&v22->_maxLength, a6);
    objc_storeStrong((id *)&v22->_validValues, a7);
    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v18, v30, v31, v32, v33);
    v23 = objc_claimAutoreleasedReturnValue();
    format = v22->_format;
    v22->_format = (NSString *)v23;

    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v19);
    v25 = objc_claimAutoreleasedReturnValue();
    units = v22->_units;
    v22->_units = (NSString *)v25;

    objc_msgSend(MEMORY[0x24BE3F208], "hmf_cachedInstanceForString:", v20);
    v27 = objc_claimAutoreleasedReturnValue();
    manufacturerDescription = v22->_manufacturerDescription;
    v22->_manufacturerDescription = (NSString *)v27;

  }
  return v22;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("[%@"));
  -[HMDCharacteristicMetadata _descriptionDetails](self, "_descriptionDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  return (NSString *)v3;
}

- (id)dumpState
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[HMDCharacteristicMetadata _descriptionDetails](self, "_descriptionDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, *MEMORY[0x24BE3EB68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionDetails
{
  void *v3;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicMetadata format](self, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata format](self, "format");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Format: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[HMDCharacteristicMetadata units](self, "units");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata units](self, "units");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Units: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[HMDCharacteristicMetadata minimumValue](self, "minimumValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata minimumValue](self, "minimumValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("MinValue: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[HMDCharacteristicMetadata maximumValue](self, "maximumValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata maximumValue](self, "maximumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("MaxValue: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMDCharacteristicMetadata stepValue](self, "stepValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata stepValue](self, "stepValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("StepValue: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMDCharacteristicMetadata maxLength](self, "maxLength");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata maxLength](self, "maxLength");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Max length: %@"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  -[HMDCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    -[HMDCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Manufacturer Description: %@"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v31);

  }
  -[HMDCharacteristicMetadata validValues](self, "validValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Valid Values: "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMDCharacteristicMetadata validValues](self, "validValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v44;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v44 != v38)
            objc_enumerationMutation(v35);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v39));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v40);

          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v37);
    }

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)dictionaryRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_minimumValue, CFSTR("metadataMinimumValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_maximumValue, CFSTR("metadataMaximumValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_stepValue, CFSTR("metadataStepValue"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_maxLength, CFSTR("metadataMaxLength"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_validValues, CFSTR("metadataValidValues"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_manufacturerDescription, CFSTR("metadataUserDescription"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_format, CFSTR("metadataFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_units, CFSTR("metadataUnits"));
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[HMDCharacteristicMetadata minimumValue](self, "minimumValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDCharacteristicMetadata maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDCharacteristicMetadata stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMDCharacteristicMetadata maxLength](self, "maxLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMDCharacteristicMetadata format](self, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[HMDCharacteristicMetadata units](self, "units");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  -[HMDCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  -[HMDCharacteristicMetadata validValues](self, "validValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  HMDCharacteristicMetadata *v4;
  HMDCharacteristicMetadata *v5;
  HMDCharacteristicMetadata *v6;
  HMDCharacteristicMetadata *v7;
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

  v4 = (HMDCharacteristicMetadata *)a3;
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
    -[HMDCharacteristicMetadata minimumValue](v6, "minimumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if (!v9)
      goto LABEL_14;
    -[HMDCharacteristicMetadata maximumValue](v7, "maximumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_14;
    -[HMDCharacteristicMetadata stepValue](v7, "stepValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if (!v13)
      goto LABEL_14;
    -[HMDCharacteristicMetadata maxLength](v7, "maxLength");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if (!v15)
      goto LABEL_14;
    -[HMDCharacteristicMetadata format](v7, "format");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    if (!v17)
      goto LABEL_14;
    -[HMDCharacteristicMetadata units](v7, "units");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = HMFEqualObjects();

    if (!v19)
      goto LABEL_14;
    -[HMDCharacteristicMetadata manufacturerDescription](v7, "manufacturerDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

    if (v21)
    {
      -[HMDCharacteristicMetadata validValues](v7, "validValues");
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

- (HMDCharacteristicMetadata)initWithCoder:(id)a3
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
  HMDCharacteristicMetadata *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMinimumValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMaximumValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataStepValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataMaxLength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("metadataValidValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataFormat"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataUnits"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataUserDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMDCharacteristicMetadata initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:](self, "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HMDCharacteristicMetadata minimumValue](self, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metadataMinimumValue"));

  -[HMDCharacteristicMetadata maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadataMaximumValue"));

  -[HMDCharacteristicMetadata stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("metadataStepValue"));

  -[HMDCharacteristicMetadata maxLength](self, "maxLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metadataMaxLength"));

  -[HMDCharacteristicMetadata format](self, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("metadataFormat"));

  -[HMDCharacteristicMetadata units](self, "units");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("metadataUnits"));

  -[HMDCharacteristicMetadata manufacturerDescription](self, "manufacturerDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("metadataUserDescription"));

  -[HMDCharacteristicMetadata validValues](self, "validValues");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("metadataValidValues"));

}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
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

- (NSArray)validValues
{
  return self->_validValues;
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

+ (HMDCharacteristicMetadata)characteristicMetadataWithDictionary:(id)a3
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
  double v13;
  double v14;
  double v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("metadataMinimumValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("metadataMaximumValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("metadataStepValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("metadataMaxLength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("metadataValidValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("metadataUserDescription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("metadataFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("metadataUnits"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || v11 || v12 || (objc_msgSend(v5, "doubleValue"), v14 = v13, objc_msgSend(v6, "doubleValue"), v14 < v15))
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", v5, v6, v7, v8, v9, v11, v12, v10);
  else
    v16 = 0;

  return (HMDCharacteristicMetadata *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
