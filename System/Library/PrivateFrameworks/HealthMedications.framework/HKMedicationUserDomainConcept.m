@implementation HKMedicationUserDomainConcept

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedComponentNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyPregnancyTrimesterLactationRatings, 0);
  objc_storeStrong((id *)&self->_localizedOntologyLoggingUnitPlural, 0);
  objc_storeStrong((id *)&self->_localizedOntologyLoggingUnitSingular, 0);
  objc_storeStrong((id *)&self->_localizedOntologyBasicDoseForms, 0);
  objc_storeStrong((id *)&self->_localizedOntologyManufacturedDoseForms, 0);
  objc_storeStrong((id *)&self->_localizedOntologyGenericNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyBrandNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyPreferredNames, 0);
  objc_storeStrong((id *)&self->_semanticIdentifier, 0);
}

- (id)semanticIdentifier
{
  os_unfair_lock_s *p_computedPropertyLock;
  HKMedicationUserDomainConceptSemanticIdentifier *v4;
  HKMedicationUserDomainConceptSemanticIdentifier *semanticIdentifier;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_semanticIdentifier)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateSemanticIdentifier]((const os_unfair_lock *)self);
    v4 = (HKMedicationUserDomainConceptSemanticIdentifier *)objc_claimAutoreleasedReturnValue();
    semanticIdentifier = self->_semanticIdentifier;
    self->_semanticIdentifier = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_semanticIdentifier;
}

- (HKMedicationUserDomainConcept)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicationUserDomainConcept;
  return -[HKMedicationUserDomainConcept initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicationUserDomainConcept;
  -[HKMedicationUserDomainConcept encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationUserDomainConcept)init
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

- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "raise:format:", v7, CFSTR("The -%@ method is not available on %@"), v8, objc_opt_class());

  return 0;
}

- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5 medicationVisualizationConfig:(id)a6 freeTextProperties:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKMedicationUserDomainConcept *v21;

  v12 = a3;
  v13 = (void *)MEMORY[0x1E0CB6D20];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, a4, 0x64uLL);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v16, 0x3E8uLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "propertyCollectionWithUserSpecifiedName:userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:", v17, v18, v15, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB6830], "collectionWithCoding:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = -[HKMedicationUserDomainConcept initWithCodingCollection:supplementalPropertyCollection:](self, "initWithCodingCollection:supplementalPropertyCollection:", v20, v19);

  return v21;
}

+ (id)_truncateStringValueIfNeeded:(unint64_t)a3 limit:
{
  id v4;
  id v5;
  void *v6;

  v4 = a2;
  objc_opt_self();
  if (objc_msgSend(v4, "length") <= a3)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "substringToIndex:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5
{
  return -[HKMedicationUserDomainConcept initWithOntologyCoding:userSpecifiedName:userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:](self, "initWithOntologyCoding:userSpecifiedName:userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:", a3, a4, a5, 0, 0);
}

- (HKMedicationUserDomainConcept)initWithConceptIdentifier:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  HKMedicationUserDomainConcept *v12;

  v8 = (void *)MEMORY[0x1E0CB6828];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "appleOntologyCodingWithIdentifier:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKMedicationUserDomainConcept initWithOntologyCoding:userSpecifiedName:userSpecifiedNotes:](self, "initWithOntologyCoding:userSpecifiedName:userSpecifiedNotes:", v11, v10, v9);

  return v12;
}

- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 supplementalPropertyCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  HKMedicationUserDomainConcept *v12;
  HKMedicationUserDomainConcept *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "codings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hk_containsObjectPassingTest:", &__block_literal_global_3) & 1) == 0)
  {
    objc_msgSend(v8, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_192);

    if ((v11 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationUserDomainConcept.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[codingCollection.codings hk_containsObjectPassingTest:^BOOL(HKMedicalCoding *coding) { return coding.codingSystem == [HKMedicalCodingSystem appleOntologySystem]; }] || [supplementalPropertyCollection.properties hk_containsObjectPassingTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == HKUserDomainConceptPropertyTypeFreeTextMedicationName; }]"));
  }

LABEL_5:
  v15.receiver = self;
  v15.super_class = (Class)HKMedicationUserDomainConcept;
  v12 = -[HKMedicationUserDomainConcept initWithCodingCollection:linkCollection:propertyCollection:](&v15, sel_initWithCodingCollection_linkCollection_propertyCollection_, v7, 0, v8);
  v13 = v12;
  if (v12)
    v12->_computedPropertyLock._os_unfair_lock_opaque = 0;

  return v13;
}

BOOL __89__HKMedicationUserDomainConcept_initWithCodingCollection_supplementalPropertyCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "codingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6838], "appleOntologySystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

BOOL __89__HKMedicationUserDomainConcept_initWithCodingCollection_supplementalPropertyCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 160020;
}

- (id)copyMedicationByUpdatingUserSpecifiedName:(id)a3 userSpecifiedNotes:(id)a4 userVisualizationConfigJSONString:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKMedicationUserDomainConcept *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  HKMedicationUserDomainConcept *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKMedicationUserDomainConcept userSpecifiedName](v11, "userSpecifiedName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v8;
  if ((id)v13 == v8)
    goto LABEL_8;
  v15 = (void *)v13;
  -[HKMedicationUserDomainConcept userSpecifiedName](v11, "userSpecifiedName");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[HKMedicationUserDomainConcept userSpecifiedName](v11, "userSpecifiedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
      goto LABEL_9;
    if (v8)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB6CF0], "nullPropertyWithType:version:", 160000, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);
    goto LABEL_8;
  }

  if (!v8)
    goto LABEL_7;
LABEL_5:
  +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v8, 0x64uLL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160000, 1, v14);
  objc_msgSend(v12, "addObject:", v20);

LABEL_8:
LABEL_9:
  -[HKMedicationUserDomainConcept userSpecifiedNotes](v11, "userSpecifiedNotes");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v9;
  if ((id)v21 != v9)
  {
    v23 = (void *)v21;
    -[HKMedicationUserDomainConcept userSpecifiedNotes](v11, "userSpecifiedNotes");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[HKMedicationUserDomainConcept userSpecifiedNotes](v11, "userSpecifiedNotes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v9, "isEqualToString:", v26);

      if ((v27 & 1) != 0)
        goto LABEL_17;
      if (v9)
        goto LABEL_13;
    }
    else
    {

      if (v9)
      {
LABEL_13:
        +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v9, 0x3E8uLL);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160001, 1, v22);
        objc_msgSend(v12, "addObject:", v28);

        goto LABEL_16;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB6CF0], "nullPropertyWithType:version:", 160001, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v22);
  }
LABEL_16:

LABEL_17:
  -[HKMedicationUserDomainConcept userVisualizationConfigJSONString](v11, "userVisualizationConfigJSONString");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v10;
  if ((id)v29 == v10)
  {
LABEL_26:

    goto LABEL_27;
  }
  v31 = (void *)v29;
  -[HKMedicationUserDomainConcept userVisualizationConfigJSONString](v11, "userVisualizationConfigJSONString");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

    goto LABEL_22;
  }
  v33 = (void *)v32;
  -[HKMedicationUserDomainConcept userVisualizationConfigJSONString](v11, "userVisualizationConfigJSONString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v10, "isEqualToString:", v34);

  if ((v35 & 1) == 0)
  {
LABEL_22:
    if (v10)
    {
      v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160008, 1, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6CF0], "nullPropertyWithType:version:", 160008, 1);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v36;
    objc_msgSend(v12, "addObject:", v36);
    goto LABEL_26;
  }
LABEL_27:
  if (objc_msgSend(v12, "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v12);
    v38 = (HKMedicationUserDomainConcept *)-[HKMedicationUserDomainConcept copyUserDomainConceptByMergingInPropertyCollection:](v11, "copyUserDomainConceptByMergingInPropertyCollection:", v37);

  }
  else
  {
    v38 = v11;
  }

  return v38;
}

- (id)_generateDisplayNameComponents
{
  id v1;
  __CFString *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "freeTextMedicationName");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(v1, "localizedOntologyPreferredNames");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("en_US"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v4 = CFSTR("No Name");
    if (v2)
      v4 = v2;
    v5 = v4;

    objc_msgSend(v1, "localizedOntologyBrandNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("en_US"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v1, "localizedOntologyGenericNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("en_US"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (v7)
      v9 = v7;
    else
      v9 = v5;
    v10 = v9;

    objc_msgSend(v1, "freeTextMedicationIngredientNamedStrengthQuantities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_13;
    v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v13, "setNumberStyle:", 1);
    objc_msgSend(v13, "setMaximumFractionDigits:", 2);
    objc_msgSend(v13, "setRoundingMode:", 6);
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "value");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "unitString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
LABEL_13:
      objc_msgSend(v1, "unlocalizedQuantifiedUnitStrengthPreferredDisplayString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6898]), "initWithFullDisplayName:medicationDisplayName:displayStrength:", v5, v10, v19);

  }
  return v1;
}

- (id)_generateLoggingUnit
{
  void *v2;
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
  uint64_t v14;

  if (a1)
  {
    objc_msgSend(a1, "freeTextMedicationLoggingUnitCode");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB68C0]), "initWithLoggingUnitCode:", objc_msgSend(v2, "integerValue"));
    }
    else
    {
      objc_msgSend(a1, "localizedOntologyLoggingUnitSingular");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("en_US"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "localizedOntologyLoggingUnitPlural");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("en_US"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "localizedOntologyLoggingUnitSingular");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("en-US"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "localizedOntologyLoggingUnitPlural");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("en-US"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        v12 = v5;
      else
        v12 = v9;
      if (v7)
        v13 = v7;
      else
        v13 = v11;
      if (v12 && v13)
      {
        objc_msgSend(MEMORY[0x1E0CB68C0], "loggingUnitByResolvingSingularLoggingUnitString:fallbackPluralLoggingUnitString:");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB68C0]), "initWithLoggingUnitCode:", 12);
      }
      v3 = (void *)v14;

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)canRequestSyncUponInsertion
{
  return 1;
}

- (id)_deepCopy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicationUserDomainConcept;
  -[HKMedicationUserDomainConcept _deepCopy](&v3, sel__deepCopy);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
    -[HKMedicationUserDomainConcept userSpecifiedName](self, "userSpecifiedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationUserDomainConcept userSpecifiedNotes](self, "userSpecifiedNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("userSpecifiedName: \"%@\", userSpecifiedNotes: %lu"), v6, objc_msgSend(v7, "length"));

  }
  return v3;
}

+ (id)_typeIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6D48], "medicationUserDomainConceptTypeIdentifier");
}

- (HKMedicationUserDomainConceptSemanticIdentifier)_computedPropertyLock_generateSemanticIdentifier
{
  HKMedicationUserDomainConceptSemanticIdentifier *v1;
  void *v2;
  HKMedicationUserDomainConceptSemanticIdentifier *v3;
  HKMedicationUserDomainConceptSemanticIdentifier *v4;
  void *v5;

  v1 = (HKMedicationUserDomainConceptSemanticIdentifier *)a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 28);
    -[HKMedicationUserDomainConceptSemanticIdentifier firstOntologyCoding](v1, "firstOntologyCoding");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = [HKMedicationUserDomainConceptSemanticIdentifier alloc];
    v4 = v3;
    if (v2)
    {
      v1 = -[HKMedicationUserDomainConceptSemanticIdentifier initWithUUID:medicalCoding:](v3, "initWithUUID:medicalCoding:", 0, v2);
    }
    else
    {
      -[HKMedicationUserDomainConceptSemanticIdentifier UUID](v1, "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = -[HKMedicationUserDomainConceptSemanticIdentifier initWithUUID:medicalCoding:](v4, "initWithUUID:medicalCoding:", v5, 0);

    }
  }
  return v1;
}

- (id)_computedPropertyLock_generateLocalizedNamesWithPropertyType:(const os_unfair_lock *)a1
{
  id v2;
  void *v4;
  void *v5;

  v2 = (id)a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 28);
    objc_msgSend(v2, "propertyCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allPropertiesWithType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "hk_mapToDictionary:", &__block_literal_global_210);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = (id)MEMORY[0x1E0C9AA70];
    }

  }
  return v2;
}

void __94__HKMedicationUserDomainConcept__computedPropertyLock_generateLocalizedNamesWithPropertyType___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "locale");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, id, void *))a3)[2](v5, v8, v7);
}

- (id)_computedPropertyLock_generateListOfLocalizedNamesWithPropertyType:(os_unfair_lock *)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  os_unfair_lock_assert_owner(a1 + 28);
  -[os_unfair_lock propertyCollection](a1, "propertyCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPropertiesWithType:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "locale", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);
          }
          objc_msgSend(v15, "addObject:", v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v16 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v16;
}

- (NSString)userSpecifiedName
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)userSpecifiedNotes
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)userVisualizationConfigJSONString
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160008);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)freeTextMedicationName
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160020);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSNumber)freeTextMedicationFormCode
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160014);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (NSNumber)freeTextMedicationLoggingUnitCode
{
  void *v2;
  void *v3;
  unint64_t v4;
  NSNumber *v5;

  -[HKMedicationUserDomainConcept freeTextMedicationFormCode](self, "freeTextMedicationFormCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = (int)objc_msgSend(v2, "intValue") - 1, v4 <= 0x10))
    v5 = (NSNumber *)qword_1E6CD5640[v4];
  else
    v5 = 0;

  return v5;
}

- (HKQuantity)freeTextMedicationStrengthQuantity
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept freeTextMedicationIngredientNamedStrengthQuantities](self, "freeTextMedicationIngredientNamedStrengthQuantities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v4;
}

- (NSArray)freeTextMedicationIngredientNamedStrengthQuantities
{
  void *v2;
  void *v3;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesWithType:", 160021);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)localizedOntologyPreferredNames
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyPreferredNames;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyPreferredNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160012);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyPreferredNames = self->_localizedOntologyPreferredNames;
    self->_localizedOntologyPreferredNames = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyPreferredNames;
}

- (NSDictionary)localizedOntologyBrandNames
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyBrandNames;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyBrandNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160007);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyBrandNames = self->_localizedOntologyBrandNames;
    self->_localizedOntologyBrandNames = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyBrandNames;
}

- (NSDictionary)localizedOntologyGenericNames
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyGenericNames;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyGenericNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160009);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyGenericNames = self->_localizedOntologyGenericNames;
    self->_localizedOntologyGenericNames = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyGenericNames;
}

- (NSDictionary)localizedOntologyManufacturedDoseForms
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyManufacturedDoseForms;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyManufacturedDoseForms)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160010);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyManufacturedDoseForms = self->_localizedOntologyManufacturedDoseForms;
    self->_localizedOntologyManufacturedDoseForms = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyManufacturedDoseForms;
}

- (NSDictionary)localizedOntologyBasicDoseForms
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyBasicDoseForms;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyBasicDoseForms)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160016);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyBasicDoseForms = self->_localizedOntologyBasicDoseForms;
    self->_localizedOntologyBasicDoseForms = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyBasicDoseForms;
}

- (NSDictionary)localizedOntologyLoggingUnitSingular
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyLoggingUnitSingular;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyLoggingUnitSingular)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160017);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyLoggingUnitSingular = self->_localizedOntologyLoggingUnitSingular;
    self->_localizedOntologyLoggingUnitSingular = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyLoggingUnitSingular;
}

- (NSDictionary)localizedOntologyLoggingUnitPlural
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyLoggingUnitPlural;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyLoggingUnitPlural)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160018);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyLoggingUnitPlural = self->_localizedOntologyLoggingUnitPlural;
    self->_localizedOntologyLoggingUnitPlural = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyLoggingUnitPlural;
}

- (NSDictionary)localizedOntologyPregnancyTrimesterLactationRatings
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedOntologyPregnancyTrimesterLactationRatings;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyPregnancyTrimesterLactationRatings)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 180000);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyPregnancyTrimesterLactationRatings = self->_localizedOntologyPregnancyTrimesterLactationRatings;
    self->_localizedOntologyPregnancyTrimesterLactationRatings = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedOntologyPregnancyTrimesterLactationRatings;
}

- (NSString)unlocalizedQuantifiedUnitStrengthPreferredDisplayString
{
  void *v2;
  void *v3;
  void *v4;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 160013);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HKOntologyLocalizedEducationContent)localizedOntologyEducationContent
{
  void *v2;
  void *v3;

  -[HKMedicationUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstPropertyWithType:", 160019);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKOntologyLocalizedEducationContent *)v3;
}

- (NSDictionary)localizedOntologyComponentNames
{
  os_unfair_lock_s *p_computedPropertyLock;
  NSDictionary *v4;
  NSDictionary *localizedComponentNames;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedComponentNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateListOfLocalizedNamesWithPropertyType:]((os_unfair_lock *)self, 160022);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedComponentNames = self->_localizedComponentNames;
    self->_localizedComponentNames = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_localizedComponentNames;
}

@end
