@implementation HKAllergyReaction

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("manifestations");
  v8[1] = CFSTR("severity");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)allergyReactionWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithManifestationCodings:onsetDate:severityCoding:", v10, v9, v8);

  return v11;
}

- (HKAllergyReaction)init
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

- (HKAllergyReaction)initWithManifestationCodings:(id)a3 onsetDate:(id)a4 severityCoding:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKAllergyReaction *v12;
  uint64_t v13;
  NSArray *manifestationCodings;
  uint64_t v15;
  HKMedicalDate *onsetDate;
  uint64_t v17;
  HKMedicalCoding *severityCoding;
  void *v19;
  uint64_t v20;
  NSArray *manifestations;
  void *v22;
  uint64_t v23;
  HKConcept *severity;
  void *v26;
  void *v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAllergyReaction.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifestationCodings"));

  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAllergyReaction.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[manifestationCodings count] > 0"));

  }
  v28.receiver = self;
  v28.super_class = (Class)HKAllergyReaction;
  v12 = -[HKAllergyReaction init](&v28, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_107);
    v13 = objc_claimAutoreleasedReturnValue();
    manifestationCodings = v12->_manifestationCodings;
    v12->_manifestationCodings = (NSArray *)v13;

    v15 = objc_msgSend(v10, "copy");
    onsetDate = v12->_onsetDate;
    v12->_onsetDate = (HKMedicalDate *)v15;

    v17 = objc_msgSend(v11, "copy");
    severityCoding = v12->_severityCoding;
    v12->_severityCoding = (HKMedicalCoding *)v17;

    -[HKAllergyReaction manifestationCodingCollections](v12, "manifestationCodingCollections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_map:", &__block_literal_global_22_2);
    v20 = objc_claimAutoreleasedReturnValue();
    manifestations = v12->_manifestations;
    v12->_manifestations = (NSArray *)v20;

    if (v12->_severityCoding)
    {
      -[HKAllergyReaction severityCodingCollection](v12, "severityCodingCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      severity = v12->_severity;
      v12->_severity = (HKConcept *)v23;

    }
  }

  return v12;
}

id __75__HKAllergyReaction_initWithManifestationCodings_onsetDate_severityCoding___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

id __75__HKAllergyReaction_initWithManifestationCodings_onsetDate_severityCoding___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAllergyReaction manifestations](self, "manifestations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAllergyReaction severityCoding](self, "severityCoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAllergyReaction severity](self, "severity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p manifestationCodings = %@, manifestations = %@, severityCoding = %@, severity = %@>"), v5, self, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAllergyReaction)initWithCoder:(id)a3
{
  id v4;
  HKAllergyReaction *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *manifestationCodings;
  uint64_t v11;
  HKMedicalDate *onsetDate;
  uint64_t v13;
  HKMedicalCoding *severityCoding;
  void *v15;
  uint64_t v16;
  NSArray *manifestations;
  uint64_t v18;
  HKConcept *severity;
  HKAllergyReaction *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKAllergyReaction;
  v5 = -[HKAllergyReaction init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ManifestationCodings"));
    v9 = objc_claimAutoreleasedReturnValue();
    manifestationCodings = v5->_manifestationCodings;
    v5->_manifestationCodings = (NSArray *)v9;

    if (!v5->_manifestationCodings)
    {
      v20 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OnsetDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    onsetDate = v5->_onsetDate;
    v5->_onsetDate = (HKMedicalDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SeverityCoding"));
    v13 = objc_claimAutoreleasedReturnValue();
    severityCoding = v5->_severityCoding;
    v5->_severityCoding = (HKMedicalCoding *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("Manifestations"));
    v16 = objc_claimAutoreleasedReturnValue();
    manifestations = v5->_manifestations;
    v5->_manifestations = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Severity"));
    v18 = objc_claimAutoreleasedReturnValue();
    severity = v5->_severity;
    v5->_severity = (HKConcept *)v18;

  }
  v20 = v5;
LABEL_6:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ManifestationCodings"));

  -[HKAllergyReaction onsetDate](self, "onsetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("OnsetDate"));

  -[HKAllergyReaction severityCoding](self, "severityCoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SeverityCoding"));

  -[HKAllergyReaction manifestations](self, "manifestations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Manifestations"));

  -[HKAllergyReaction severity](self, "severity");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Severity"));

}

- (HKMedicalCodingCollection)severityCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyReaction severityCoding](self, "severityCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyReaction severityCoding](self, "severityCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (HKMedicalCodingCollection *)v5;
}

- (NSArray)manifestationCodingCollections
{
  void *v2;
  void *v3;

  -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

HKMedicalCodingCollection *__51__HKAllergyReaction_manifestationCodingCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", a2);
}

- (NSArray)manifestationCodings
{
  return self->_manifestationCodings;
}

- (NSArray)manifestations
{
  NSArray *manifestations;
  NSArray *v3;
  void *v4;

  manifestations = self->_manifestations;
  if (manifestations)
  {
    v3 = manifestations;
  }
  else
  {
    -[HKAllergyReaction manifestationCodingCollections](self, "manifestationCodingCollections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_43);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __35__HKAllergyReaction_manifestations__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalCoding)severityCoding
{
  return self->_severityCoding;
}

- (HKConcept)severity
{
  HKConcept *severity;
  HKConcept *v3;
  void *v4;

  if (self->_severityCoding)
  {
    severity = self->_severity;
    if (severity)
    {
      v3 = severity;
    }
    else
    {
      -[HKAllergyReaction severityCodingCollection](self, "severityCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKAllergyReaction onsetDate](self, "onsetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HKAllergyReaction severityCoding](self, "severityCoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKAllergyReaction *v4;
  HKAllergyReaction *v5;
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
  char v38;

  v4 = (HKAllergyReaction *)a3;
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
      -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyReaction manifestationCodings](v5, "manifestationCodings");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKAllergyReaction manifestationCodings](v5, "manifestationCodings");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_29;
        v10 = (void *)v9;
        -[HKAllergyReaction manifestationCodings](self, "manifestationCodings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyReaction manifestationCodings](v5, "manifestationCodings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_30;
      }
      -[HKAllergyReaction onsetDate](self, "onsetDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyReaction onsetDate](v5, "onsetDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKAllergyReaction onsetDate](v5, "onsetDate");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_29;
        v17 = (void *)v16;
        -[HKAllergyReaction onsetDate](self, "onsetDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyReaction onsetDate](v5, "onsetDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_30;
      }
      -[HKAllergyReaction severityCoding](self, "severityCoding");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyReaction severityCoding](v5, "severityCoding");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HKAllergyReaction severityCoding](v5, "severityCoding");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_29;
        v23 = (void *)v22;
        -[HKAllergyReaction severityCoding](self, "severityCoding");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyReaction severityCoding](v5, "severityCoding");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_30;
      }
      -[HKAllergyReaction manifestations](self, "manifestations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyReaction manifestations](v5, "manifestations");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v27)
      {

      }
      else
      {
        v8 = (void *)v27;
        -[HKAllergyReaction manifestations](v5, "manifestations");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_29;
        v29 = (void *)v28;
        -[HKAllergyReaction manifestations](self, "manifestations");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyReaction manifestations](v5, "manifestations");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToArray:", v31);

        if (!v32)
          goto LABEL_30;
      }
      -[HKAllergyReaction severity](self, "severity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyReaction severity](v5, "severity");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v33)
      {

LABEL_34:
        v14 = 1;
        goto LABEL_31;
      }
      v8 = (void *)v33;
      -[HKAllergyReaction severity](v5, "severity");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        -[HKAllergyReaction severity](self, "severity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyReaction severity](v5, "severity");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if ((v38 & 1) != 0)
          goto LABEL_34;
LABEL_30:
        v14 = 0;
LABEL_31:

        goto LABEL_32;
      }
LABEL_29:

      goto LABEL_30;
    }
    v14 = 0;
  }
LABEL_32:

  return v14;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("manifestations")))
  {
    -[HKAllergyReaction manifestationCodingCollections](self, "manifestationCodingCollections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v7, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("severity")))
    {
      +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
      v8 = 0;
      goto LABEL_9;
    }
    if (!self->_severityCoding)
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_9;
    }
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v8;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HKConcept *v12;
  HKConcept *severity;
  BOOL v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("severity")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), self->_severityCoding != 0, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (HKConcept *)objc_msgSend(v11, "copy");
      severity = self->_severity;
      self->_severity = v12;

      v14 = 1;
      goto LABEL_10;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("manifestations")))
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
    goto LABEL_9;
  }
  +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, -[NSArray count](self->_manifestationCodings, "count"), v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15 != 0;
  if (v15)
    objc_storeStrong((id *)&self->_manifestations, v15);

LABEL_10:
  return v14;
}

- (HKMedicalDate)onsetDate
{
  return self->_onsetDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onsetDate, 0);
  objc_storeStrong((id *)&self->_manifestations, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_manifestationCodings, 0);
  objc_storeStrong((id *)&self->_severityCoding, 0);
}

@end
