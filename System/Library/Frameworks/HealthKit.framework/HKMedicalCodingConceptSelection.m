@implementation HKMedicalCodingConceptSelection

- (HKMedicalCodingConceptSelection)init
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

- (HKMedicalCodingConceptSelection)initWithMedicalCoding:(id)a3
{
  id v4;
  HKMedicalCodingConceptSelection *v5;
  uint64_t v6;
  HKMedicalCoding *coding;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalCodingConceptSelection;
  v5 = -[HKConceptSelection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    coding = v5->_coding;
    v5->_coding = (HKMedicalCoding *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: %@>"), objc_opt_class(), self, self->_coding);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_coding, CFSTR("coding"));
}

- (HKMedicalCodingConceptSelection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKMedicalCodingConceptSelection *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[HKMedicalCodingConceptSelection initWithMedicalCoding:](self, "initWithMedicalCoding:", v5);
    v6 = self;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, 0);
    objc_msgSend(v4, "failWithError:", v8);

    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicalCodingConceptSelection *v4;
  HKMedicalCodingConceptSelection *v5;
  HKMedicalCodingConceptSelection *v6;
  HKMedicalCoding *coding;
  HKMedicalCoding *v8;
  void *v9;
  HKMedicalCoding *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = (HKMedicalCodingConceptSelection *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v14.receiver = self,
          v14.super_class = (Class)HKMedicalCodingConceptSelection,
          -[HKConceptSelection isEqual:](&v14, sel_isEqual_, v6)))
    {
      coding = self->_coding;
      -[HKMedicalCodingConceptSelection coding](v6, "coding");
      v8 = (HKMedicalCoding *)objc_claimAutoreleasedReturnValue();
      if (coding == v8)
      {
        v12 = 1;
      }
      else
      {
        -[HKMedicalCodingConceptSelection coding](v6, "coding");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_coding;
          -[HKMedicalCodingConceptSelection coding](v6, "coding");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[HKMedicalCoding isEqual:](v10, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (HKMedicalCoding)coding
{
  return self->_coding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coding, 0);
}

@end
