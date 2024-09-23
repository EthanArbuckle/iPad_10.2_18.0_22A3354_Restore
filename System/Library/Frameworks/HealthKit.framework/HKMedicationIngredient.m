@implementation HKMedicationIngredient

- (HKMedicationIngredient)init
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

- (HKMedicationIngredient)initWithSubstanceCodingCollection:(id)a3 numerator:(id)a4 denominator:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKMedicationIngredient *v11;
  uint64_t v12;
  HKClinicalCodingCollection *substanceCodingCollection;
  uint64_t v14;
  HKQuantity *numerator;
  uint64_t v16;
  HKQuantity *denominator;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationIngredient;
  v11 = -[HKMedicationIngredient init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    substanceCodingCollection = v11->_substanceCodingCollection;
    v11->_substanceCodingCollection = (HKClinicalCodingCollection *)v12;

    v14 = objc_msgSend(v9, "copy");
    numerator = v11->_numerator;
    v11->_numerator = (HKQuantity *)v14;

    v16 = objc_msgSend(v10, "copy");
    denominator = v11->_denominator;
    v11->_denominator = (HKQuantity *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationIngredient *v4;
  HKMedicationIngredient *v5;
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
  char v26;

  v4 = (HKMedicationIngredient *)a3;
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
      -[HKMedicationIngredient substanceCodingCollection](v5, "substanceCodingCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationIngredient substanceCodingCollection](self, "substanceCodingCollection");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedicationIngredient substanceCodingCollection](self, "substanceCodingCollection");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        -[HKMedicationIngredient substanceCodingCollection](v5, "substanceCodingCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationIngredient substanceCodingCollection](self, "substanceCodingCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_20;
      }
      -[HKMedicationIngredient numerator](v5, "numerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationIngredient numerator](self, "numerator");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKMedicationIngredient numerator](self, "numerator");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        -[HKMedicationIngredient numerator](v5, "numerator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationIngredient numerator](self, "numerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_20;
      }
      -[HKMedicationIngredient denominator](v5, "denominator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationIngredient denominator](self, "denominator");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

LABEL_24:
        v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HKMedicationIngredient denominator](self, "denominator");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[HKMedicationIngredient denominator](v5, "denominator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationIngredient denominator](self, "denominator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HKClinicalCodingCollection hash](self->_substanceCodingCollection, "hash");
  v4 = -[HKQuantity hash](self->_numerator, "hash") ^ v3;
  return v4 ^ -[HKQuantity hash](self->_denominator, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationIngredient)initWithCoder:(id)a3
{
  id v4;
  HKMedicationIngredient *v5;
  uint64_t v6;
  HKClinicalCodingCollection *substanceCodingCollection;
  uint64_t v8;
  HKQuantity *numerator;
  uint64_t v10;
  HKQuantity *denominator;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationIngredient;
  v5 = -[HKMedicationIngredient init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Collection"));
    v6 = objc_claimAutoreleasedReturnValue();
    substanceCodingCollection = v5->_substanceCodingCollection;
    v5->_substanceCodingCollection = (HKClinicalCodingCollection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Numerator"));
    v8 = objc_claimAutoreleasedReturnValue();
    numerator = v5->_numerator;
    v5->_numerator = (HKQuantity *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Denominator"));
    v10 = objc_claimAutoreleasedReturnValue();
    denominator = v5->_denominator;
    v5->_denominator = (HKQuantity *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKClinicalCodingCollection *substanceCodingCollection;
  id v5;

  substanceCodingCollection = self->_substanceCodingCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", substanceCodingCollection, CFSTR("Collection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numerator, CFSTR("Numerator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_denominator, CFSTR("Denominator"));

}

- (HKClinicalCodingCollection)substanceCodingCollection
{
  return self->_substanceCodingCollection;
}

- (HKQuantity)numerator
{
  return self->_numerator;
}

- (HKQuantity)denominator
{
  return self->_denominator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denominator, 0);
  objc_storeStrong((id *)&self->_numerator, 0);
  objc_storeStrong((id *)&self->_substanceCodingCollection, 0);
}

@end
