@implementation HKFHIRIdentifierElement

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("type");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)identifierWithTypeCodings:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTypeCodings:value:", v7, v6);

  return v8;
}

- (HKFHIRIdentifierElement)init
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

- (HKFHIRIdentifierElement)initWithTypeCodings:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  HKFHIRIdentifierElement *v9;
  uint64_t v10;
  NSArray *typeCodings;
  uint64_t v12;
  NSString *value;
  void *v14;
  uint64_t v15;
  HKConcept *type;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRIdentifierElement.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("typeCodings"));

  }
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRIdentifierElement.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[typeCodings count] > 0"));

  }
  v20.receiver = self;
  v20.super_class = (Class)HKFHIRIdentifierElement;
  v9 = -[HKFHIRIdentifierElement init](&v20, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    typeCodings = v9->_typeCodings;
    v9->_typeCodings = (NSArray *)v10;

    v12 = objc_msgSend(v8, "copy");
    value = v9->_value;
    v9->_value = (NSString *)v12;

    if (v9->_typeCodings)
    {
      -[HKFHIRIdentifierElement typeCodingCollection](v9, "typeCodingCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      type = v9->_type;
      v9->_type = (HKConcept *)v15;

    }
  }

  return v9;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifierElement type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFHIRIdentifierElement value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p typeCoding = %@, type = %@, value = %@>"), v5, self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRIdentifierElement)initWithCoder:(id)a3
{
  id v4;
  HKFHIRIdentifierElement *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *typeCodings;
  uint64_t v11;
  NSString *value;
  uint64_t v13;
  HKConcept *type;
  HKFHIRIdentifierElement *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKFHIRIdentifierElement;
  v5 = -[HKFHIRIdentifierElement init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("TypeCodings"));
    v9 = objc_claimAutoreleasedReturnValue();
    typeCodings = v5->_typeCodings;
    v5->_typeCodings = (NSArray *)v9;

    if (!v5->_typeCodings)
    {
      v15 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Type"));
    v13 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (HKConcept *)v13;

  }
  v15 = v5;
LABEL_6:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("TypeCodings"));

  -[HKFHIRIdentifierElement value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Value"));

  -[HKFHIRIdentifierElement type](self, "type");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Type"));

}

- (HKMedicalCodingCollection)typeCodingCollection
{
  void *v2;
  void *v3;

  -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKMedicalCodingCollection *)v3;
}

- (HKConcept)type
{
  HKConcept *type;
  HKConcept *v3;
  void *v4;

  type = self->_type;
  if (type)
  {
    v3 = type;
  }
  else
  {
    -[HKFHIRIdentifierElement typeCodingCollection](self, "typeCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setType:(id)a3
{
  id v4;
  NSObject *v5;
  HKConcept *v6;
  HKConcept *type;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKFHIRIdentifierElement _setType:].cold.1(v5);
  }
  v6 = (HKConcept *)objc_msgSend(v4, "copy");
  type = self->_type;
  self->_type = v6;

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HKFHIRIdentifierElement value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKFHIRIdentifierElement *v4;
  HKFHIRIdentifierElement *v5;
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
  char v20;

  v4 = (HKFHIRIdentifierElement *)a3;
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
      -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRIdentifierElement typeCodings](v5, "typeCodings");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKFHIRIdentifierElement typeCodings](v5, "typeCodings");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        -[HKFHIRIdentifierElement typeCodings](self, "typeCodings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRIdentifierElement typeCodings](v5, "typeCodings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      -[HKFHIRIdentifierElement value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKFHIRIdentifierElement value](v5, "value");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKFHIRIdentifierElement value](v5, "value");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[HKFHIRIdentifierElement value](self, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKFHIRIdentifierElement value](v5, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("type")))
  {
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", self->_typeCodings);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_assignError:code:format:", a4, 3, CFSTR("%@ does not support codings for key path %@"), v12, v6);

    v9 = 0;
  }

  return v9;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  HKConcept *v13;
  HKConcept *type;
  void *v15;
  objc_class *v16;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("type"));
  if (v10)
  {
    v11 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), self->_typeCodings != 0, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "object");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (HKConcept *)objc_msgSend(v9, "copy");
    type = self->_type;
    self->_type = v13;

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, CFSTR("%@ does not support restoring concepts for key path %@"), v12, v9);
  }

LABEL_7:
  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (NSArray)typeCodings
{
  return self->_typeCodings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_typeCodings, 0);
}

- (void)_setType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property type for record type HKCoverageClassification.", v1, 2u);
}

@end
