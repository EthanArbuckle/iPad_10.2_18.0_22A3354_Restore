@implementation HKMedicalUserDomainConcept

- (HKMedicalUserDomainConcept)init
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

- (HKMedicalUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
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

- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3 countryCode:(id)a4 codingCollection:(id)a5 propertyCollection:(id)a6
{
  id v10;
  id v11;
  HKMedicalUserDomainConcept *v12;
  uint64_t v13;
  NSArray *categoryTypes;
  uint64_t v15;
  NSString *countryCode;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicalUserDomainConcept;
  v12 = -[HKUserDomainConcept initWithCodingCollection:linkCollection:propertyCollection:](&v18, sel_initWithCodingCollection_linkCollection_propertyCollection_, a5, 0, a6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    categoryTypes = v12->_categoryTypes;
    v12->_categoryTypes = (NSArray *)v13;

    v15 = objc_msgSend(v11, "copy");
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v15;

    v12->_computedPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3
{
  return -[HKMedicalUserDomainConcept initWithCategoryTypes:countryCode:codingCollection:propertyCollection:](self, "initWithCategoryTypes:countryCode:codingCollection:propertyCollection:", a3, 0, 0, 0);
}

- (id)medicalConceptByReplacingCategoryTypes:(id)a3 codingCollection:(id)a4 linkCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCategoryTypes:", v10);

  objc_msgSend(v11, "_setCodingCollection:", v9);
  objc_msgSend(v11, "_setLinkCollection:", v8);

  return v11;
}

- (id)medicalConceptByReplacingCategoryTypes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCategoryTypes:", v4);

  return v5;
}

- (id)medicalConceptByAddingCategoryType:(int64_t)a3
{
  void *v5;
  NSArray *categoryTypes;
  void *v7;
  void *v8;

  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  categoryTypes = self->_categoryTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObject:](categoryTypes, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setCategoryTypes:", v8);

  return v5;
}

- (id)_deepCopy
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicalUserDomainConcept;
  -[HKUserDomainConcept _deepCopy](&v5, sel__deepCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCategoryTypes:", self->_categoryTypes);
  objc_msgSend(v3, "_setCountryCode:", self->_countryCode);
  return v3;
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
    -[HKMedicalUserDomainConcept ontologyPreferredName](self, "ontologyPreferredName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("\"%@\"), v6);

    if (self->_countryCode)
      objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), self->_countryCode);
    if (-[NSArray count](self->_categoryTypes, "count"))
    {
      objc_msgSend(v3, "appendString:", CFSTR(" ("));
      objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), self->_categoryTypes, &__block_literal_global_46);
      objc_msgSend(v3, "appendString:", CFSTR(")"));
    }
    -[HKMedicalUserDomainConcept educationContent](self, "educationContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "appendString:", CFSTR(", education ("));
      objc_msgSend(v7, "sections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v8, &__block_literal_global_29);

      objc_msgSend(v3, "appendString:", CFSTR(")"));
    }

  }
  return v3;
}

__CFString *__63__HKMedicalUserDomainConcept__dataDescriptionAllowedForPublic___block_invoke(uint64_t a1, void *a2)
{
  return HKStringFromMedicalRecordCategoryType(objc_msgSend(a2, "integerValue"));
}

__CFString *__63__HKMedicalUserDomainConcept__dataDescriptionAllowedForPublic___block_invoke_2(uint64_t a1, void *a2)
{
  return HKStringFromOntologyLocalizedEducationContentSectionType(objc_msgSend(a2, "sectionType"));
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier medicalUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "medicalUserDomainConceptIdentifier");
}

- (id)semanticIdentifier
{
  os_unfair_lock_s *p_computedPropertyLock;
  HKMedicalUserDomainConceptSemanticIdentifier *v4;
  HKMedicalUserDomainConceptSemanticIdentifier *semanticIdentifier;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_semanticIdentifier)
  {
    -[HKMedicalUserDomainConcept _generateSemanticIdentifier](self, "_generateSemanticIdentifier");
    v4 = (HKMedicalUserDomainConceptSemanticIdentifier *)objc_claimAutoreleasedReturnValue();
    semanticIdentifier = self->_semanticIdentifier;
    self->_semanticIdentifier = v4;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_semanticIdentifier;
}

- (BOOL)canRequestSyncUponInsertion
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMedicalUserDomainConcept;
  v4 = a3;
  -[HKUserDomainConcept encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryTypes, CFSTR("categoryTypes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));

}

- (HKMedicalUserDomainConcept)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKMedicalUserDomainConcept *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("categoryTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalUserDomainConcept;
  v7 = -[HKUserDomainConcept initWithCoder:](&v9, sel_initWithCoder_, v4);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_categoryTypes, v5);
    objc_storeStrong((id *)&v7->_countryCode, v6);
    v7->_computedPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)ontologyPreferredName
{
  void *v2;
  void *v3;

  -[HKMedicalUserDomainConcept preferredNameByLocaleIdentifier](self, "preferredNameByLocaleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("(null)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)preferredNameByLocaleIdentifier
{
  os_unfair_lock_s *p_computedPropertyLock;
  void *v4;
  void *v5;
  NSDictionary *preferredNameByLocaleIdentifier;
  NSDictionary *v7;
  NSDictionary *v8;

  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_preferredNameByLocaleIdentifier)
  {
    -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allPropertiesWithType:", 160012);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 || !objc_msgSend(v5, "count"))
    {
      preferredNameByLocaleIdentifier = self->_preferredNameByLocaleIdentifier;
      self->_preferredNameByLocaleIdentifier = (NSDictionary *)MEMORY[0x1E0C9AA70];

    }
    objc_msgSend(v5, "hk_mapToDictionary:", &__block_literal_global_39);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_preferredNameByLocaleIdentifier;
    self->_preferredNameByLocaleIdentifier = v7;

  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  return self->_preferredNameByLocaleIdentifier;
}

void __61__HKMedicalUserDomainConcept_preferredNameByLocaleIdentifier__block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
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

- (BOOL)chartsBloodPressure
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 150004);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)hidesOutOfRangeFilter
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 150005);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isLowUtility
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstBasicPropertyWithType:", 150009);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (HKOntologyLocalizedEducationContent)educationContent
{
  void *v2;
  void *v3;

  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstPropertyWithType:", 160019);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKOntologyLocalizedEducationContent *)v3;
}

- (void)_setCategoryTypes:(id)a3
{
  NSArray *v4;
  NSArray *categoryTypes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  categoryTypes = self->_categoryTypes;
  self->_categoryTypes = v4;

}

- (void)_setCountryCode:(id)a3
{
  NSString *v4;
  NSString *countryCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  countryCode = self->_countryCode;
  self->_countryCode = v4;

}

- (id)_generateSemanticIdentifier
{
  void *v3;
  void *v4;
  id v5;
  HKMedicalUserDomainConceptSemanticIdentifier *v6;
  void *v7;
  HKMedicalUserDomainConceptSemanticIdentifier *v8;
  HKMedicalUserDomainConceptSemanticIdentifier *v10;
  void *v11;

  -[HKUserDomainConcept firstOntologyCoding](self, "firstOntologyCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HKUserDomainConcept firstAdhocCoding](self, "firstAdhocCoding");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = [HKMedicalUserDomainConceptSemanticIdentifier alloc];
      -[HKUserDomainConcept UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString uppercaseString](self->_countryCode, "uppercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HKMedicalUserDomainConceptSemanticIdentifier initWithUUID:countryCode:medicalCoding:](v10, "initWithUUID:countryCode:medicalCoding:", v7, v11, 0);

      v5 = 0;
      goto LABEL_5;
    }
  }
  v6 = [HKMedicalUserDomainConceptSemanticIdentifier alloc];
  -[NSString uppercaseString](self->_countryCode, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKMedicalUserDomainConceptSemanticIdentifier initWithUUID:countryCode:medicalCoding:](v6, "initWithUUID:countryCode:medicalCoding:", 0, v7, v5);
LABEL_5:

  return v8;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  _QWORD *v4;
  NSArray *categoryTypes;
  NSArray *v6;
  NSString *countryCode;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  objc_super v16;

  v4 = a3;
  if (-[HKUserDomainConcept isEqual:](self, "isEqual:", v4)
    && (v16.receiver = self,
        v16.super_class = (Class)HKMedicalUserDomainConcept,
        -[HKUserDomainConcept unitTesting_isIdentical:](&v16, sel_unitTesting_isIdentical_, v4))
    && ((categoryTypes = self->_categoryTypes, v6 = (NSArray *)v4[17], categoryTypes == v6)
     || v6 && -[NSArray isEqual:](categoryTypes, "isEqual:"))
    && ((countryCode = self->_countryCode, v8 = (NSString *)v4[18], countryCode == v8)
     || v8 && -[NSString isEqual:](countryCode, "isEqual:")))
  {
    -[HKMedicalUserDomainConcept educationContent](self, "educationContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "educationContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend(v4, "educationContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[HKMedicalUserDomainConcept educationContent](self, "educationContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "educationContent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)categoryTypes
{
  return self->_categoryTypes;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_categoryTypes, 0);
  objc_storeStrong((id *)&self->_semanticIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredNameByLocaleIdentifier, 0);
}

@end
