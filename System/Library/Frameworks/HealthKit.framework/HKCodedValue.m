@implementation HKCodedValue

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("concept");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", v5, v4, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)codedValueWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCodings:value:referenceRanges:", v10, v9, v8);

  return v11;
}

- (HKCodedValue)init
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

- (HKCodedValue)initWithCodings:(id)a3 value:(id)a4 referenceRanges:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKCodedValue *v12;
  uint64_t v13;
  NSArray *codings;
  uint64_t v15;
  HKInspectableValue *value;
  uint64_t v17;
  NSArray *referenceRanges;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCodedValue.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("codings"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCodedValue.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)HKCodedValue;
  v12 = -[HKCodedValue init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    codings = v12->_codings;
    v12->_codings = (NSArray *)v13;

    v15 = objc_msgSend(v10, "copy");
    value = v12->_value;
    v12->_value = (HKInspectableValue *)v15;

    v17 = objc_msgSend(v11, "copy");
    referenceRanges = v12->_referenceRanges;
    v12->_referenceRanges = (NSArray *)v17;

  }
  return v12;
}

- (void)_setOntologyConcept:(id)a3
{
  id v5;
  HKConcept *v6;
  HKConcept *ontologyConcept;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKCodedValue.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ontologyConcept"));

    v5 = 0;
  }
  v6 = (HKConcept *)objc_msgSend(v5, "copy");
  ontologyConcept = self->_ontologyConcept;
  self->_ontologyConcept = v6;

}

- (HKConcept)ontologyConcept
{
  HKConcept *ontologyConcept;
  void *v3;
  void *v4;

  ontologyConcept = self->_ontologyConcept;
  +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", self->_codings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSafeConcept(ontologyConcept, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKConcept *)v4;
}

- (id)chartableCodedQuantityWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSArray *codings;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HKInspectableValue codedQuantityValue](self->_value, "codedQuantityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSArray firstObject](self->_referenceRanges, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    codings = self->_codings;
    objc_msgSend(v6, "valueRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "min");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "codedQuantityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "max");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "codedQuantityValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKChartableCodedQuantity chartableCodedQuantityWithCodings:originalCodedQuantity:originalRangeLowCodedQuantity:originalRangeHighCodedQuantity:error:](HKChartableCodedQuantity, "chartableCodedQuantityWithCodings:originalCodedQuantity:originalRangeLowCodedQuantity:originalRangeHighCodedQuantity:error:", codings, v5, v10, v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)chartableCodedQuantitySetWithDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSArray *codings;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  -[HKInspectableValue codedQuantityValue](self->_value, "codedQuantityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKCodedValue chartableCodedQuantityWithError:](self, "chartableCodedQuantityWithError:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[HKChartableCodedQuantitySet setWithChartableQuantity:date:](HKChartableCodedQuantitySet, "setWithChartableQuantity:date:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    -[HKInspectableValue codedValueCollection](self->_value, "codedValueCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      v26 = 0;
      -[HKInspectableValue codedValueCollection](self->_value, "codedValueCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "codedValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __56__HKCodedValue_chartableCodedQuantitySetWithDate_error___block_invoke;
      v20[3] = &unk_1E37E6E10;
      v20[4] = &v21;
      objc_msgSend(v12, "hk_map:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)v22[5];
      if (v14)
      {
        v15 = v14;
        v16 = v15;
        if (a4)
          *a4 = objc_retainAutorelease(v15);
        else
          _HKLogDroppedError(v15);

        v9 = 0;
      }
      else
      {
        codings = self->_codings;
        v19 = 0;
        +[HKChartableCodedQuantitySet setWithMedicalCodings:quantities:date:error:](HKChartableCodedQuantitySet, "setWithMedicalCodings:quantities:date:error:", codings, v13, v6, &v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to create chartable quantity set from coded value %@"), self);
      v9 = 0;
    }
  }

  return v9;
}

id __56__HKCodedValue_chartableCodedQuantitySetWithDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(a2, "chartableCodedQuantityWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedValue)initWithCoder:(id)a3
{
  id v4;
  HKCodedValue *v5;
  void *v6;
  uint64_t v7;
  NSArray *codings;
  uint64_t v9;
  HKConcept *ontologyConcept;
  uint64_t v11;
  HKInspectableValue *value;
  void *v13;
  uint64_t v14;
  NSArray *referenceRanges;
  HKCodedValue *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKCodedValue;
  v5 = -[HKCodedValue init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("Codings"));
    v7 = objc_claimAutoreleasedReturnValue();
    codings = v5->_codings;
    v5->_codings = (NSArray *)v7;

    if (!v5->_codings)
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ontologyConcept"));
    v9 = objc_claimAutoreleasedReturnValue();
    ontologyConcept = v5->_ontologyConcept;
    v5->_ontologyConcept = (HKConcept *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (HKInspectableValue *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ReferenceRanges"));
    v14 = objc_claimAutoreleasedReturnValue();
    referenceRanges = v5->_referenceRanges;
    v5->_referenceRanges = (NSArray *)v14;

  }
  v16 = v5;
LABEL_6:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *codings;
  id v5;

  codings = self->_codings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codings, CFSTR("Codings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ontologyConcept, CFSTR("ontologyConcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("Value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referenceRanges, CFSTR("ReferenceRanges"));

}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSArray hash](self->_codings, "hash");
  v4 = -[HKConcept hash](self->_ontologyConcept, "hash") ^ v3;
  v5 = -[HKInspectableValue hash](self->_value, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_referenceRanges, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKCodedValue *v4;
  HKCodedValue *v5;
  NSArray *codings;
  NSArray *v7;
  HKConcept *ontologyConcept;
  HKConcept *v9;
  HKInspectableValue *value;
  HKInspectableValue *v11;
  NSArray *referenceRanges;
  NSArray *v13;
  BOOL v14;

  v4 = (HKCodedValue *)a3;
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
      codings = self->_codings;
      v7 = v5->_codings;
      v14 = 0;
      if (codings == v7 || v7 && -[NSArray isEqual:](codings, "isEqual:"))
      {
        ontologyConcept = self->_ontologyConcept;
        v9 = v5->_ontologyConcept;
        if (ontologyConcept == v9 || v9 && -[HKConcept isEqual:](ontologyConcept, "isEqual:"))
        {
          value = self->_value;
          v11 = v5->_value;
          if (value == v11 || v11 && -[HKInspectableValue isEqual:](value, "isEqual:"))
          {
            referenceRanges = self->_referenceRanges;
            v13 = v5->_referenceRanges;
            if (referenceRanges == v13 || v13 && -[NSArray isEqual:](referenceRanges, "isEqual:"))
              v14 = 1;
          }
        }
      }

    }
    else
    {
      v14 = 0;
    }
  }

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
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("concept")))
  {
    if (self->_codings)
    {
      +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
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
  HKConcept *ontologyConcept;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("concept"));
  if (v10)
  {
    v11 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), self->_codings != 0, (uint64_t)v9, (uint64_t)a5);

    if (!v11)
    {
      LOBYTE(v10) = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (HKConcept *)objc_msgSend(v12, "copy");
    ontologyConcept = self->_ontologyConcept;
    self->_ontologyConcept = v13;

  }
  else
  {
    +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
  }

LABEL_7:
  return v10;
}

- (NSArray)codings
{
  return self->_codings;
}

- (HKInspectableValue)value
{
  return self->_value;
}

- (NSArray)referenceRanges
{
  return self->_referenceRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceRanges, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_codings, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
}

@end
