@implementation HKConcept

+ (id)fallbackLanguagesForLocale:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CA")) & 1) != 0)
  {
    v4 = &unk_1E389D858;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GB")) & 1) != 0)
  {
    v4 = &unk_1E389D870;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("US")))
  {
    v4 = &unk_1E389D888;
  }
  else
  {
    v4 = &unk_1E389D8A0;
  }

  return v4;
}

+ (id)preferredLanguages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testablePreferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fallbackLanguagesForLocale:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (HKConcept)conceptWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKConcept *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HKConcept initWithIdentifier:attributes:relationships:version:deleted:options:]([HKConcept alloc], "initWithIdentifier:attributes:relationships:version:deleted:options:", v9, v8, v7, 0, 0, 0);

  return v10;
}

- (id)copyWithRelationships:(id)a3
{
  id v4;
  HKConcept *v5;

  v4 = a3;
  v5 = -[HKConcept initWithIdentifier:attributes:relationships:version:deleted:options:]([HKConcept alloc], "initWithIdentifier:attributes:relationships:version:deleted:options:", self->_identifier, self->_attributes, v4, self->_version, self->_deleted, self->_options);

  return v5;
}

- (id)firstConceptOfRelationshipType:(int64_t)a3
{
  NSArray *relationships;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[5];

  if (!-[HKConcept relationshipsAreLoaded](self, "relationshipsAreLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConcept.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.relationshipsAreLoaded"));

  }
  relationships = self->_relationships;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__HKConcept_firstConceptOfRelationshipType___block_invoke;
  v11[3] = &__block_descriptor_40_e31_B16__0__HKConceptRelationship_8l;
  v11[4] = a3;
  -[NSArray hk_firstObjectPassingTest:](relationships, "hk_firstObjectPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __44__HKConcept_firstConceptOfRelationshipType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)allConceptsOfRelationshipType:(int64_t)a3
{
  NSArray *relationships;
  void *v8;
  _QWORD v9[5];

  if (!-[HKConcept relationshipsAreLoaded](self, "relationshipsAreLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConcept.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.relationshipsAreLoaded"));

  }
  relationships = self->_relationships;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HKConcept_allConceptsOfRelationshipType___block_invoke;
  v9[3] = &__block_descriptor_40_e42___HKConcept_16__0__HKConceptRelationship_8l;
  v9[4] = a3;
  -[NSArray hk_map:](relationships, "hk_map:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__HKConcept_allConceptsOfRelationshipType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HKConcept)initWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  HKConcept *v18;
  uint64_t v19;
  HKConceptIdentifier *identifier;
  uint64_t v21;
  NSArray *attributes;
  _BOOL8 v23;
  void *v25;
  void *v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConcept.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKConcept.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attributes"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)HKConcept;
  v18 = -[HKConcept init](&v27, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v15, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (HKConceptIdentifier *)v19;

    v21 = objc_msgSend(v16, "copy");
    attributes = v18->_attributes;
    v18->_attributes = (NSArray *)v21;

    objc_storeStrong((id *)&v18->_relationships, a5);
    v18->_deleted = a7;
    v23 = v18->_relationships != 0;
    v18->_version = a6;
    v18->_options = v23 | a8;
  }

  return v18;
}

- (HKConcept)init
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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[HKConcept identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  if (-[HKConceptIdentifier isInMemory](self->_identifier, "isInMemory"))
  {
    -[HKConcept adHocCode](self, "adHocCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }

  return v6 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  HKConcept *v4;
  HKConcept *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HKConcept *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[HKConceptIdentifier isEqual:](self->_identifier, "isEqual:", v5->_identifier))
      {
        if (-[HKConceptIdentifier isInMemory](self->_identifier, "isInMemory"))
        {
          -[HKConcept adHocCode](self, "adHocCode");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKConcept adHocCode](v5, "adHocCode");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v6, "isEqual:", v7);

        }
        else
        {
          v8 = 1;
        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)mutateBySettingRelationships:(id)a3
{
  NSArray *v4;
  NSArray *relationships;

  self->_options |= 1uLL;
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  relationships = self->_relationships;
  self->_relationships = v4;

}

- (HKConcept)groupByConcept
{
  HKConcept *v3;

  -[HKConcept firstConceptOfRelationshipType:](self, "firstConceptOfRelationshipType:", 1013);
  v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self;
  return v3;
}

- (HKConcept)chartedWithConcept
{
  return (HKConcept *)-[HKConcept firstConceptOfRelationshipType:](self, "firstConceptOfRelationshipType:", 54838);
}

- (NSSet)validInRegions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 959);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("US"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v7;
}

- (NSString)preferredName
{
  void *v2;
  void *v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 1012);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedPreferredName
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "preferredLanguages");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(&unk_1E389D2D8, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", objc_msgSend(v9, "integerValue"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (_os_feature_enabled_impl())
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [%@]"), v12, v8, (_QWORD)v17);
              v15 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = v12;
            }
            v14 = v15;

            v13 = v3;
            goto LABEL_18;
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[HKConcept preferredName](self, "preferredName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
    v13 = v13;
  v14 = v13;
LABEL_18:

  return (NSString *)v14;
}

- (id)firstAttributeForType:(int64_t)a3
{
  NSArray *attributes;
  _QWORD v5[5];

  attributes = self->_attributes;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__HKConcept_firstAttributeForType___block_invoke;
  v5[3] = &__block_descriptor_40_e28_B16__0__HKConceptAttribute_8l;
  v5[4] = a3;
  -[NSArray hk_firstObjectPassingTest:](attributes, "hk_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __35__HKConcept_firstAttributeForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)attributesForType:(int64_t)a3
{
  NSArray *attributes;
  _QWORD v5[5];

  attributes = self->_attributes;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__HKConcept_attributesForType___block_invoke;
  v5[3] = &__block_descriptor_40_e28_B16__0__HKConceptAttribute_8l;
  v5[4] = a3;
  -[NSArray hk_filter:](attributes, "hk_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __31__HKConcept_attributesForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (void)enumerateAttributesWithType:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HKConcept attributes](self, "attributes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "type") == a3)
          v6[2](v6, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)stringsForAttributeType:(int64_t)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__HKConcept_stringsForAttributeType___block_invoke;
  v9[3] = &unk_1E37E9DB8;
  v10 = v5;
  v6 = v5;
  -[HKConcept enumerateAttributesWithType:block:](self, "enumerateAttributesWithType:block:", a3, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

void __37__HKConcept_stringsForAttributeType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)isAdHoc
{
  void *v2;
  BOOL v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isNebulous
{
  void *v2;
  BOOL v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 1011);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isGeneric
{
  void *v2;
  char v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 846);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isLowUtility
{
  void *v2;
  char v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 989);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isExcludedFromSearch
{
  void *v2;
  char v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 620);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isInMemory
{
  return -[HKConceptIdentifier isInMemory](self->_identifier, "isInMemory");
}

- (BOOL)chartsBloodPressure
{
  void *v2;
  char v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 61813);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hidesOutOfRangeFilter
{
  void *v2;
  char v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 61839);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSArray)synonyms
{
  return (NSArray *)-[HKConcept stringsForAttributeType:](self, "stringsForAttributeType:", 56926);
}

- (NSString)adHocCode
{
  void *v2;
  void *v3;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HKMedicalCoding)LOINCCoding
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 1009);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HKMedicalCodingSystem LOINCCodeSystem](HKMedicalCodingSystem, "LOINCCodeSystem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v5, 0, v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (HKMedicalCoding *)v6;
}

- (HKMedicalCoding)RxNormCoding
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 1008);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[HKMedicalCodingSystem RxNormCodeSystem](HKMedicalCodingSystem, "RxNormCodeSystem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v5, 0, v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return (HKMedicalCoding *)v6;
}

- (HKMedicalCoding)coding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKMedicalCoding *v8;

  -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HKMedicalCodingSystem adHocConceptSystem](HKMedicalCodingSystem, "adHocConceptSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HKMedicalCodingSystem appleOntologySystem](HKMedicalCodingSystem, "appleOntologySystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKConcept identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = -[HKMedicalCoding initWithCodingSystem:codingVersion:code:displayString:]([HKMedicalCoding alloc], "initWithCodingSystem:codingVersion:code:displayString:", v4, 0, v5, 0);

  return v8;
}

- (BOOL)relationshipsAreLoaded
{
  return self->_options & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConcept)initWithCoder:(id)a3
{
  id v4;
  id v5;
  HKConcept *v6;
  HKConceptIdentifier *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *attributes;
  HKConceptIdentifier *identifier;
  HKConceptIdentifier *v14;
  uint64_t v15;
  NSArray *relationships;
  objc_super v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "_decodingCyclesIsAllowed") & 1) == 0)
      objc_msgSend(v5, "_allowDecodingCyclesInSecureMode");

  }
  v18.receiver = self;
  v18.super_class = (Class)HKConcept;
  v6 = -[HKConcept init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v7 = (HKConceptIdentifier *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Attributes"));
    v11 = objc_claimAutoreleasedReturnValue();
    attributes = v6->_attributes;
    v6->_attributes = (NSArray *)v11;

    identifier = v6->_identifier;
    v6->_identifier = v7;
    v14 = v7;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Relationships"));
    v15 = objc_claimAutoreleasedReturnValue();
    relationships = v6->_relationships;
    v6->_relationships = (NSArray *)v15;

    v6->_version = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Version"));
    v6->_deleted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Deleted"));
    v6->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options"));

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *attributes;
  id v5;

  attributes = self->_attributes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", attributes, CFSTR("Attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relationships, CFSTR("Relationships"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("Version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("Deleted"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));

}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier");
  -[HKConcept preferredName](self, "preferredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HKConcept: Identifier: %lld, Preferred Name: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)treeDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@, Tree:\n"), self);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[HKConcept identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, 0);

  -[HKConcept _appendTreeDescriptionToString:visitedStack:](self, "_appendTreeDescriptionToString:visitedStack:", v3, v6);
  return v3;
}

- (void)_appendTreeDescriptionToString:(id)a3 visitedStack:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "appendFormat:", CFSTR("%012lld"), -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier"));
  if (-[NSArray count](self->_attributes, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(" ["));
    -[HKConcept _appendSortedAttributeTypeCountDescriptionToString:](self, "_appendSortedAttributeTypeCountDescriptionToString:", v6);
    objc_msgSend(v6, "appendFormat:", CFSTR("]"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\n"));
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%*s"), (10 * v8 - 8), ");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HKConcept _sortedRelationships](self, "_sortedRelationships");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "appendString:", v9);
        objc_msgSend(v14, "destination");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v7, "containsObject:", v16);

        if (v17)
        {
          v18 = objc_msgSend(v14, "type");
          objc_msgSend(v14, "destination");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%04lld -> %012lld [CYCLE DETECTED]\n"), v18, objc_msgSend(v20, "rawIdentifier"));

        }
        else
        {
          objc_msgSend(v14, "destination");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v22);

          objc_msgSend(v6, "appendFormat:", CFSTR("%04lld -> "), objc_msgSend(v14, "type"));
          objc_msgSend(v14, "destination");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_appendTreeDescriptionToString:visitedStack:", v6, v7);

          objc_msgSend(v7, "removeLastObject");
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

- (id)_sortedRelationships
{
  return -[NSArray sortedArrayUsingComparator:](self->_relationships, "sortedArrayUsingComparator:", &__block_literal_global_10);
}

uint64_t __33__HKConcept__sortedRelationships__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = HKCompareIntegers(objc_msgSend(v4, "type"), objc_msgSend(v5, "type"));
  if (!v6)
  {
    objc_msgSend(v4, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rawIdentifier");
    objc_msgSend(v5, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HKCompareIntegers(v9, objc_msgSend(v11, "rawIdentifier"));

  }
  return v6;
}

- (void)_appendSortedAttributeTypeCountDescriptionToString:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_attributes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "hk_sortedKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HKConcept__appendSortedAttributeTypeCountDescriptionToString___block_invoke;
  v16[3] = &unk_1E37E9E20;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v4, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v14, v16);

}

id __64__HKConcept__appendSortedAttributeTypeCountDescriptionToString___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "longLongValue");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%04lld: %04lld"), v6, objc_msgSend(v7, "longLongValue"));
  return v8;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isUndefined
{
  return self->_isUndefined;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_relationships, 0);
}

@end
