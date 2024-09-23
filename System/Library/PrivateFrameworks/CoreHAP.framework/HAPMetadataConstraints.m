@implementation HAPMetadataConstraints

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(id)a3
{
  objc_storeStrong((id *)&self->_maxLength, a3);
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[HAPMetadataConstraints minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[1];
    v5[1] = v7;

    -[HAPMetadataConstraints maximumValue](self, "maximumValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    -[HAPMetadataConstraints stepValue](self, "stepValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[3];
    v5[3] = v13;

    -[HAPMetadataConstraints minLength](self, "minLength");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = (void *)v5[4];
    v5[4] = v16;

    -[HAPMetadataConstraints maxLength](self, "maxLength");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copyWithZone:", a3);
    v20 = (void *)v5[5];
    v5[5] = v19;

    -[HAPMetadataConstraints validValues](self, "validValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copyWithZone:", a3);
    v23 = (void *)v5[6];
    v5[6] = v22;

  }
  return v5;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)minLength
{
  return self->_minLength;
}

- (void)setStepValue:(id)a3
{
  objc_storeStrong((id *)&self->_stepValue, a3);
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
}

- (void)setValidValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setMinLength:(id)a3
{
  objc_storeStrong((id *)&self->_minLength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("[ Constraints:"));
  -[HAPMetadataConstraints minimumValue](self, "minimumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HAPMetadataConstraints minimumValue](self, "minimumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), CFSTR(" "), CFSTR("Min: "), v6);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  -[HAPMetadataConstraints maximumValue](self, "maximumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    ++v7;
    if (v4)
      v9 = CFSTR(", ");
    else
      v9 = CFSTR(" ");
    -[HAPMetadataConstraints maximumValue](self, "maximumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v9, CFSTR("Max: "), v11);

  }
  -[HAPMetadataConstraints stepValue](self, "stepValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v7 + 1;
    if (v7)
      v14 = CFSTR(", ");
    else
      v14 = CFSTR(" ");
    -[HAPMetadataConstraints stepValue](self, "stepValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%.2f"), v14, CFSTR("Step: "), v16);

    v7 = v13;
  }
  -[HAPMetadataConstraints minLength](self, "minLength");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v7 + 1;
    if (v7)
      v19 = CFSTR(", ");
    else
      v19 = CFSTR(" ");
    -[HAPMetadataConstraints minLength](self, "minLength");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%u"), v19, CFSTR("Min length: "), objc_msgSend(v20, "unsignedIntValue"));

    v7 = v18;
  }
  -[HAPMetadataConstraints maxLength](self, "maxLength");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (v7)
      v22 = CFSTR(", ");
    else
      v22 = CFSTR(" ");
    -[HAPMetadataConstraints maxLength](self, "maxLength");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%u"), v22, CFSTR("Max length: "), objc_msgSend(v23, "unsignedIntValue"));

    v7 = 1;
  }
  -[HAPMetadataConstraints validValues](self, "validValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    if (v7)
      v26 = CFSTR(", ");
    else
      v26 = CFSTR(" ");
    objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v26, CFSTR("Valid Values: "));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HAPMetadataConstraints validValues](self, "validValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v29);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
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
  unint64_t v14;

  -[HAPMetadataConstraints minimumValue](self, "minimumValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPMetadataConstraints maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HAPMetadataConstraints stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[HAPMetadataConstraints minLength](self, "minLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[HAPMetadataConstraints maxLength](self, "maxLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[HAPMetadataConstraints validValues](self, "validValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isEqualToMetadataConstraints:(id)a3
{
  HAPMetadataConstraints *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  uint64_t v22;
  uint64_t v23;

  v4 = (HAPMetadataConstraints *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    -[HAPMetadataConstraints minimumValue](self, "minimumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataConstraints minimumValue](v4, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = numbersAreNotEqualNilSafe(v5, v6);

    if ((v7 & 1) != 0)
      goto LABEL_8;
    -[HAPMetadataConstraints maximumValue](self, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataConstraints maximumValue](v4, "maximumValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = numbersAreNotEqualNilSafe(v8, v9);

    if ((v10 & 1) != 0)
      goto LABEL_8;
    -[HAPMetadataConstraints stepValue](self, "stepValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataConstraints stepValue](v4, "stepValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = numbersAreNotEqualNilSafe(v11, v12);

    if ((v13 & 1) != 0)
      goto LABEL_8;
    -[HAPMetadataConstraints minLength](self, "minLength");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataConstraints minLength](v4, "minLength");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = numbersAreNotEqualNilSafe(v14, v15);

    if ((v16 & 1) != 0
      || (-[HAPMetadataConstraints maxLength](self, "maxLength"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HAPMetadataConstraints maxLength](v4, "maxLength"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = numbersAreNotEqualNilSafe(v17, v18),
          v18,
          v17,
          (v19 & 1) != 0))
    {
LABEL_8:
      v20 = 0;
    }
    else
    {
      -[HAPMetadataConstraints validValues](self, "validValues");
      v22 = objc_claimAutoreleasedReturnValue();
      -[HAPMetadataConstraints validValues](v4, "validValues");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v22 | v23)
        v20 = objc_msgSend((id)v22, "isEqualToArray:", v23);
      else
        v20 = 1;

    }
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HAPMetadataConstraints minimumValue](self, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CMinV"));

  -[HAPMetadataConstraints maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CMaxV"));

  -[HAPMetadataConstraints stepValue](self, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CSV"));

  -[HAPMetadataConstraints minLength](self, "minLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CMinL"));

  -[HAPMetadataConstraints maxLength](self, "maxLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CMaxL"));

  -[HAPMetadataConstraints validValues](self, "validValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("CVV"));

}

- (HAPMetadataConstraints)initWithCoder:(id)a3
{
  id v4;
  HAPMetadataConstraints *v5;
  uint64_t v6;
  NSNumber *minimumValue;
  uint64_t v8;
  NSNumber *maximumValue;
  uint64_t v10;
  NSNumber *stepValue;
  uint64_t v12;
  NSNumber *minLength;
  uint64_t v14;
  NSNumber *maxLength;
  uint64_t v16;
  NSArray *validValues;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HAPMetadataConstraints;
  v5 = -[HAPMetadataConstraints init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMinV"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimumValue = v5->_minimumValue;
    v5->_minimumValue = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMaxV"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumValue = v5->_maximumValue;
    v5->_maximumValue = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSV"));
    v10 = objc_claimAutoreleasedReturnValue();
    stepValue = v5->_stepValue;
    v5->_stepValue = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMinL"));
    v12 = objc_claimAutoreleasedReturnValue();
    minLength = v5->_minLength;
    v5->_minLength = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMaxL"));
    v14 = objc_claimAutoreleasedReturnValue();
    maxLength = v5->_maxLength;
    v5->_maxLength = (NSNumber *)v14;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("CVV"));
    v16 = objc_claimAutoreleasedReturnValue();
    validValues = v5->_validValues;
    v5->_validValues = (NSArray *)v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
