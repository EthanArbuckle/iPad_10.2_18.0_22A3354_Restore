@implementation HKOntologyLocalizedEducationContent

- (HKOntologyLocalizedEducationContent)init
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

- (HKOntologyLocalizedEducationContent)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The -%@ method is not available on %@"), v9, objc_opt_class());

  return 0;
}

- (HKOntologyLocalizedEducationContent)initWithSections:(id)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  HKOntologyLocalizedEducationContent *v12;
  uint64_t v13;
  NSArray *sections;
  void *v16;
  objc_super v17;

  v6 = a6;
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOntologyLocalizedEducationContent.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sections != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HKOntologyLocalizedEducationContent;
  v12 = -[HKUserDomainConceptProperty initWithType:version:timestamp:deleted:](&v17, sel_initWithType_version_timestamp_deleted_, 160019, a4, v6, a5);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    sections = v12->_sections;
    v12->_sections = (NSArray *)v13;

  }
  return v12;
}

+ (id)nullPropertyWithVersion:(int64_t)a3
{
  return (id)objc_msgSend(a1, "nullPropertyWithVersion:timestamp:", a3, CFAbsoluteTimeGetCurrent());
}

+ (id)nullPropertyWithVersion:(int64_t)a3 timestamp:(double)a4
{
  id v6;

  v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v6, "initWithSections:version:timestamp:deleted:", MEMORY[0x1E0C9AA60], a3, 1, a4);
}

- (id)valueDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  const char *v7;
  void *v8;
  void *v9;

  -[NSArray hk_map:](self->_sections, "hk_map:", &__block_literal_global_53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[NSArray count](self->_sections, "count");
  if (-[NSArray count](self->_sections, "count") == 1)
    v7 = "";
  else
    v7 = "s";
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p with %ld section%s (%@)>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__55__HKOntologyLocalizedEducationContent_valueDescription__block_invoke(uint64_t a1, void *a2)
{
  return HKStringFromOntologyLocalizedEducationContentSectionType(objc_msgSend(a2, "sectionType"));
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v11 || !objc_msgSend(v11, "count"))
  {
    v18 = v10;
LABEL_14:
    v19 = v18;
    goto LABEL_15;
  }
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    v18 = v12;
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOntologyLocalizedEducationContent.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("intoListOfProperties.count == 1"));

  }
  if (objc_msgSend(v12, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOntologyLocalizedEducationContent.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromListOfProperties.count == 1"));

  }
  objc_msgSend(v10, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mergeDataFromSectionsInto:fromContent:options:", v13, v14, a6);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if ((void *)v15 == v13)
  {
    v17 = v10;
  }
  else if ((void *)v15 == v14)
  {
    v17 = v12;
  }
  else
  {
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v17;

LABEL_15:
  return v19;
}

+ (id)_mergeDataFromSectionsInto:(id)a3 fromContent:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  HKOntologyLocalizedEducationContent *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  HKOntologyLocalizedEducationContent *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  id v35;
  char v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_msgSend(v7, "version");
  if (v9 > objc_msgSend(v8, "version"))
    goto LABEL_2;
  v12 = objc_msgSend(v7, "version");
  v13 = objc_msgSend(v8, "version");
  v11 = 0;
  if ((a5 & 1) == 0)
  {
    v10 = v8;
    if (v12 != v13)
      goto LABEL_8;
    objc_msgSend(v7, "timestamp");
    v15 = v14;
    objc_msgSend(v8, "timestamp");
    if (v15 > v16)
    {
LABEL_2:
      v10 = v7;

      v11 = 1;
      goto LABEL_8;
    }
    v11 = 0;
  }
  v10 = v8;
LABEL_8:
  if (objc_msgSend(v10, "isDeleted"))
  {
    v17 = (HKOntologyLocalizedEducationContent *)v10;
  }
  else
  {
    v36 = v11;
    v34 = v10;
    objc_msgSend(v8, "_sectionsUniquedByLocaleSectionTypePairing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v7;
    objc_msgSend(v7, "_sectionsUniquedByLocaleSectionTypePairing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v18, "mutableCopy");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKOntologyLocalizedEducationContentSection sectionByMerging:sectionToMergeFrom:options:](HKOntologyLocalizedEducationContentSection, "sectionByMerging:sectionToMergeFrom:options:", v27, v26, a5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28 != v27)
          {
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, v25);
            v36 = 1;
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v22);
    }

    if ((v36 & 1) != 0)
    {
      v29 = [HKOntologyLocalizedEducationContent alloc];
      v30 = v37;
      objc_msgSend(v37, "allValues");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v34;
      v32 = objc_msgSend(v34, "version");
      objc_msgSend(v34, "timestamp");
      v17 = -[HKOntologyLocalizedEducationContent initWithSections:version:timestamp:deleted:](v29, "initWithSections:version:timestamp:deleted:", v31, v32, 0);

    }
    else
    {
      v17 = (HKOntologyLocalizedEducationContent *)v8;
      v10 = v34;
      v30 = v37;
    }

    v7 = v35;
  }

  return v17;
}

- (id)_sectionsUniquedByLocaleSectionTypePairing
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (int64_t)count
{
  return -[NSArray count](self->_sections, "count");
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_sections, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKOntologyLocalizedEducationContent *v4;
  HKOntologyLocalizedEducationContent *v5;
  char v6;
  objc_super v8;

  v4 = (HKOntologyLocalizedEducationContent *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)HKOntologyLocalizedEducationContent;
      if (-[HKUserDomainConceptProperty isEqual:](&v8, sel_isEqual_, v5))
        v6 = -[NSArray isEqual:](self->_sections, "isEqual:", v5->_sections);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
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
  v5.super_class = (Class)HKOntologyLocalizedEducationContent;
  v4 = a3;
  -[HKUserDomainConceptProperty encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, CFSTR("sections"), v5.receiver, v5.super_class);

}

- (HKOntologyLocalizedEducationContent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HKOntologyLocalizedEducationContent *v8;
  objc_super v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)HKOntologyLocalizedEducationContent;
  v8 = -[HKUserDomainConceptProperty initWithCoder:](&v10, sel_initWithCoder_, v5);

  if (v8)
    objc_storeStrong((id *)&v8->_sections, v7);

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_sections, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (HKOntologyLocalizedEducationContentSection)primarySection
{
  return (HKOntologyLocalizedEducationContentSection *)-[HKOntologyLocalizedEducationContent firstSectionWithType:](self, "firstSectionWithType:", 1);
}

- (id)firstSectionWithType:(int64_t)a3
{
  NSArray *sections;
  _QWORD v5[5];

  sections = self->_sections;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HKOntologyLocalizedEducationContent_firstSectionWithType___block_invoke;
  v5[3] = &__block_descriptor_40_e52_B16__0__HKOntologyLocalizedEducationContentSection_8l;
  v5[4] = a3;
  -[NSArray hk_firstObjectPassingTest:](sections, "hk_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __60__HKOntologyLocalizedEducationContent_firstSectionWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionType") == *(_QWORD *)(a1 + 32);
}

- (id)allSectionsWithType:(int64_t)a3
{
  NSArray *sections;
  _QWORD v5[5];

  sections = self->_sections;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HKOntologyLocalizedEducationContent_allSectionsWithType___block_invoke;
  v5[3] = &__block_descriptor_40_e52_B16__0__HKOntologyLocalizedEducationContentSection_8l;
  v5[4] = a3;
  -[NSArray hk_filter:](sections, "hk_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __59__HKOntologyLocalizedEducationContent_allSectionsWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionType") == *(_QWORD *)(a1 + 32);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
