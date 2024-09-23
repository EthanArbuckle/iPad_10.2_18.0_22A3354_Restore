@implementation HKOntologyLocalizedEducationContentSection

- (HKOntologyLocalizedEducationContentSection)init
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

- (HKOntologyLocalizedEducationContentSection)initWithSectionDataTypeMapping:(id)a3 sectionType:(int64_t)a4
{
  id v7;
  void *v8;
  HKOntologyLocalizedEducationContentSection *v9;
  HKOntologyLocalizedEducationContentSection *v10;
  uint64_t v11;
  NSDictionary *sectionDataTypeMapping;
  void *v14;
  objc_super v15;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E3894720);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOntologyLocalizedEducationContentSection.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionDataTypeMapping[@(HKOntologyEducationContentSectionDataTypeLocaleIdentifier)] != nil"));

  }
  v15.receiver = self;
  v15.super_class = (Class)HKOntologyLocalizedEducationContentSection;
  v9 = -[HKOntologyLocalizedEducationContentSection init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_sectionType = a4;
    v11 = objc_msgSend(v7, "copy");
    sectionDataTypeMapping = v10->_sectionDataTypeMapping;
    v10->_sectionDataTypeMapping = (NSDictionary *)v11;

  }
  return v10;
}

- (NSArray)sectionData
{
  return -[NSDictionary allValues](self->_sectionDataTypeMapping, "allValues");
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HKOntologyLocalizedEducationContentSection localeIdentifier](self, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), self->_sectionType, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)localizedText
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_sectionDataTypeMapping, "objectForKeyedSubscript:", &unk_1E3894738);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)localeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_sectionDataTypeMapping, "objectForKeyedSubscript:", &unk_1E3894720);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)validRegionCodes
{
  return (NSArray *)-[HKOntologyLocalizedEducationContentSection _arrayOfStringOfTypeOrNil:](self, "_arrayOfStringOfTypeOrNil:", 3);
}

- (NSArray)attributions
{
  return (NSArray *)-[HKOntologyLocalizedEducationContentSection _arrayOfStringOfTypeOrNil:](self, "_arrayOfStringOfTypeOrNil:", 4);
}

- (NSArray)citations
{
  return (NSArray *)-[HKOntologyLocalizedEducationContentSection _arrayOfStringOfTypeOrNil:](self, "_arrayOfStringOfTypeOrNil:", 5);
}

- (id)_arrayOfStringOfTypeOrNil:(int64_t)a3
{
  NSDictionary *sectionDataTypeMapping;
  void *v4;
  void *v5;
  void *v6;

  sectionDataTypeMapping = self->_sectionDataTypeMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](sectionDataTypeMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "stringValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[HKOntologyLocalizedEducationContentSection localizedText](self, "localizedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  -[HKOntologyLocalizedEducationContentSection localeIdentifier](self, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("'Length of education content: %li, localeIdentifier: %@, '"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOntologyLocalizedEducationContentSection validRegionCodes](self, "validRegionCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v7, "appendString:", CFSTR(", ["));
    -[HKOntologyLocalizedEducationContentSection validRegionCodes](self, "validRegionCodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v11);

    objc_msgSend(v7, "appendString:", CFSTR("]"));
  }
  -[HKOntologyLocalizedEducationContentSection attributions](self, "attributions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(v7, "appendString:", CFSTR(", ["));
    -[HKOntologyLocalizedEducationContentSection attributions](self, "attributions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v15);

    objc_msgSend(v7, "appendString:", CFSTR("]"));
  }
  -[HKOntologyLocalizedEducationContentSection citations](self, "citations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v7, "appendString:", CFSTR(", ["));
    -[HKOntologyLocalizedEducationContentSection citations](self, "citations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v19);

    objc_msgSend(v7, "appendString:", CFSTR("]"));
  }
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  return v7;
}

+ (id)sectionByMerging:(id)a3 sectionToMergeFrom:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  HKOntologyLocalizedEducationContentSection *v30;
  HKOntologyLocalizedEducationContentSection *v31;
  HKOntologyLocalizedEducationContentSection *v32;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v37 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v11 = objc_msgSend(v8, "sectionType");
      if (v11 != objc_msgSend(v10, "sectionType"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKOntologyLocalizedEducationContentSection.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionToMergeInto.sectionType == sectionToMergeFrom.sectionType"));

      }
      objc_msgSend(v8, "sectionDataTypeMapping");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sectionDataTypeMapping");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v12, "mutableCopy");
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v15)
      {
        v16 = v15;
        v35 = v10;
        v36 = v8;
        v17 = 0;
        v18 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v14);
            v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (!v21
              || (v24 = objc_msgSend(v22, "version"), v24 > objc_msgSend(v21, "version"))
              || (v25 = objc_msgSend(v23, "version"), v26 = objc_msgSend(v21, "version"), (v37 & 1) == 0)
              && v25 == v26
              && (objc_msgSend(v23, "timestamp"), v28 = v27, objc_msgSend(v21, "timestamp"), v28 > v29))
            {
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v23, v20);
              v17 = 1;
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v16);

        v10 = v35;
        v8 = v36;
        if ((v17 & 1) != 0)
        {
          v30 = -[HKOntologyLocalizedEducationContentSection initWithSectionDataTypeMapping:sectionType:]([HKOntologyLocalizedEducationContentSection alloc], "initWithSectionDataTypeMapping:sectionType:", v38, objc_msgSend(v36, "sectionType"));
LABEL_25:
          v32 = v30;

          goto LABEL_26;
        }
      }
      else
      {

      }
      v30 = (HKOntologyLocalizedEducationContentSection *)v8;
      goto LABEL_25;
    }
    v31 = (HKOntologyLocalizedEducationContentSection *)v8;
  }
  else
  {
    v31 = (HKOntologyLocalizedEducationContentSection *)v9;
  }
  v32 = v31;
LABEL_26:

  return v32;
}

- (unint64_t)hash
{
  int64_t sectionType;
  void *v3;
  unint64_t v4;

  sectionType = self->_sectionType;
  -[HKOntologyLocalizedEducationContentSection localeIdentifier](self, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ sectionType;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  HKOntologyLocalizedEducationContentSection *v4;
  HKOntologyLocalizedEducationContentSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HKOntologyLocalizedEducationContentSection *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKOntologyLocalizedEducationContentSection identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOntologyLocalizedEducationContentSection identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v11 = 1;
      }
      else
      {
        -[HKOntologyLocalizedEducationContentSection identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKOntologyLocalizedEducationContentSection identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKOntologyLocalizedEducationContentSection identifier](v5, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sectionType;
  id v5;

  sectionType = self->_sectionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sectionType, CFSTR("sectionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionDataTypeMapping, CFSTR("sectionDataTypeMapping"));

}

- (HKOntologyLocalizedEducationContentSection)initWithCoder:(id)a3
{
  id v4;
  HKOntologyLocalizedEducationContentSection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *sectionDataTypeMapping;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOntologyLocalizedEducationContentSection;
  v5 = -[HKOntologyLocalizedEducationContentSection init](&v12, sel_init);
  if (v5)
  {
    v5->_sectionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sectionType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "hk_typesForDictionaryMapping:to:", v7, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sectionDataTypeMapping"));
    v9 = objc_claimAutoreleasedReturnValue();
    sectionDataTypeMapping = v5->_sectionDataTypeMapping;
    v5->_sectionDataTypeMapping = (NSDictionary *)v9;

  }
  return v5;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSDictionary)sectionDataTypeMapping
{
  return self->_sectionDataTypeMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionDataTypeMapping, 0);
}

@end
