@implementation HKConceptResolutionDefinition

- (HKConceptResolutionDefinition)init
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

- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4
{
  return -[HKConceptResolutionDefinition initWithCodingCollection:countryCode:recordCategoryType:](self, "initWithCodingCollection:countryCode:recordCategoryType:", a3, a4, 0);
}

- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4 recordCategoryType:(int64_t)a5
{
  id v8;
  id v9;
  HKConceptResolutionDefinition *v10;
  uint64_t v11;
  HKMedicalCodingCollection *codingCollection;
  uint64_t v13;
  NSString *countryCode;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKConceptResolutionDefinition;
  v10 = -[HKConceptResolutionDefinition init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    codingCollection = v10->_codingCollection;
    v10->_codingCollection = (HKMedicalCodingCollection *)v11;

    v13 = objc_msgSend(v9, "copy");
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v13;

    v10->_recordCategoryType = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicalCodingCollection *codingCollection;
  id v5;

  codingCollection = self->_codingCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", codingCollection, CFSTR("ConceptResolutionDefinitionCodingCollectionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("ConceptResolutionDefinitionCountryCodeKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recordCategoryType, CFSTR("ConceptResolutionDefinitionCountryCategoryTypeKey"));

}

- (HKConceptResolutionDefinition)initWithCoder:(id)a3
{
  id v4;
  HKConceptResolutionDefinition *v5;
  uint64_t v6;
  HKMedicalCodingCollection *codingCollection;
  uint64_t v8;
  NSString *countryCode;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKConceptResolutionDefinition;
  v5 = -[HKConceptResolutionDefinition init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConceptResolutionDefinitionCodingCollectionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    codingCollection = v5->_codingCollection;
    v5->_codingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConceptResolutionDefinitionCountryCodeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    v5->_recordCategoryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ConceptResolutionDefinitionCountryCategoryTypeKey"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKConceptResolutionDefinition *v4;
  HKConceptResolutionDefinition *v5;
  HKMedicalCodingCollection *codingCollection;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HKMedicalCodingCollection *v11;
  void *v12;
  BOOL v13;
  NSString *countryCode;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  int64_t recordCategoryType;

  v4 = (HKConceptResolutionDefinition *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      codingCollection = self->_codingCollection;
      -[HKConceptResolutionDefinition codingCollection](v5, "codingCollection");
      v7 = objc_claimAutoreleasedReturnValue();
      if (codingCollection == (HKMedicalCodingCollection *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKConceptResolutionDefinition codingCollection](v5, "codingCollection");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        v11 = self->_codingCollection;
        -[HKConceptResolutionDefinition codingCollection](v5, "codingCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[HKMedicalCodingCollection isEqual:](v11, "isEqual:", v12);

        if (!(_DWORD)v11)
          goto LABEL_15;
      }
      countryCode = self->_countryCode;
      -[HKConceptResolutionDefinition countryCode](v5, "countryCode");
      v15 = objc_claimAutoreleasedReturnValue();
      if (countryCode == (NSString *)v15)
      {

LABEL_17:
        recordCategoryType = self->_recordCategoryType;
        v13 = recordCategoryType == -[HKConceptResolutionDefinition recordCategoryType](v5, "recordCategoryType");
        goto LABEL_18;
      }
      v8 = (void *)v15;
      -[HKConceptResolutionDefinition countryCode](v5, "countryCode");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v18 = self->_countryCode;
        -[HKConceptResolutionDefinition countryCode](v5, "countryCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = -[NSString isEqual:](v18, "isEqual:", v19);

        if ((_DWORD)v18)
          goto LABEL_17;
LABEL_15:
        v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKMedicalCodingCollection hash](self->_codingCollection, "hash");
  return -[NSString hash](self->_countryCode, "hash") ^ v3 ^ self->_recordCategoryType;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKMedicalCodingCollection *codingCollection;
  NSString *countryCode;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  codingCollection = self->_codingCollection;
  countryCode = self->_countryCode;
  HKStringFromMedicalRecordCategoryType(self->_recordCategoryType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ %@ /'%@/'>"), v4, self, codingCollection, countryCode, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HKMedicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_codingCollection, 0);
}

@end
