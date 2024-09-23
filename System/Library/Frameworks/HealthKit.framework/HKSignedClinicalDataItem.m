@implementation HKSignedClinicalDataItem

- (HKSignedClinicalDataItem)initWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSignedClinicalDataItem *v11;
  uint64_t v12;
  HKMedicalCodingCollection *primaryConceptCodingCollection;
  uint64_t v14;
  NSDate *relevantDate;
  uint64_t v16;
  NSUUID *medicalRecordSampleID;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKSignedClinicalDataItem;
  v11 = -[HKSignedClinicalDataItem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    primaryConceptCodingCollection = v11->_primaryConceptCodingCollection;
    v11->_primaryConceptCodingCollection = (HKMedicalCodingCollection *)v12;

    v14 = objc_msgSend(v9, "copy");
    relevantDate = v11->_relevantDate;
    v11->_relevantDate = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    medicalRecordSampleID = v11->_medicalRecordSampleID;
    v11->_medicalRecordSampleID = (NSUUID *)v16;

  }
  return v11;
}

+ (id)itemWithPrimaryConceptCodingCollection:(id)a3 relevantDate:(id)a4 medicalRecordSampleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryConceptCodingCollection:relevantDate:medicalRecordSampleID:", v10, v9, v8);

  return v11;
}

- (HKConcept)primaryConcept
{
  HKConcept *primaryConcept;
  HKConcept *v4;
  HKConcept *v5;

  primaryConcept = self->_primaryConcept;
  if (!primaryConcept)
  {
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", self->_primaryConceptCodingCollection);
    v4 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    v5 = self->_primaryConcept;
    self->_primaryConcept = v4;

    primaryConcept = self->_primaryConcept;
  }
  return primaryConcept;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[HKMedicalCodingCollection hash](self->_primaryConceptCodingCollection, "hash");
  v4 = -[NSDate hash](self->_relevantDate, "hash") ^ v3;
  return v4 ^ -[NSUUID hash](self->_medicalRecordSampleID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataItem *v4;
  HKSignedClinicalDataItem *v5;
  HKMedicalCodingCollection *primaryConceptCodingCollection;
  HKMedicalCodingCollection *v7;
  uint64_t v8;
  void *v9;
  HKMedicalCodingCollection *v10;
  void *v11;
  void *v12;
  NSDate *relevantDate;
  NSDate *v14;
  NSDate *v15;
  void *v16;
  NSUUID *medicalRecordSampleID;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (HKSignedClinicalDataItem *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      primaryConceptCodingCollection = self->_primaryConceptCodingCollection;
      -[HKSignedClinicalDataItem primaryConceptCodingCollection](v5, "primaryConceptCodingCollection");
      v7 = (HKMedicalCodingCollection *)objc_claimAutoreleasedReturnValue();
      if (primaryConceptCodingCollection != v7)
      {
        -[HKSignedClinicalDataItem primaryConceptCodingCollection](v5, "primaryConceptCodingCollection");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        v9 = (void *)v8;
        v10 = self->_primaryConceptCodingCollection;
        -[HKSignedClinicalDataItem primaryConceptCodingCollection](v5, "primaryConceptCodingCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKMedicalCodingCollection isEqual:](v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      relevantDate = self->_relevantDate;
      -[HKSignedClinicalDataItem relevantDate](v5, "relevantDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (relevantDate != v14)
      {
        -[HKSignedClinicalDataItem relevantDate](v5, "relevantDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v15 = self->_relevantDate;
        -[HKSignedClinicalDataItem relevantDate](v5, "relevantDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqualToDate:](v15, "isEqualToDate:", v16))
        {

          LOBYTE(v12) = 0;
LABEL_27:
          v23 = primaryConceptCodingCollection == v7;
          v9 = v28;
LABEL_28:
          v11 = v29;
          if (!v23)
            goto LABEL_29;
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      medicalRecordSampleID = self->_medicalRecordSampleID;
      -[HKSignedClinicalDataItem medicalRecordSampleID](v5, "medicalRecordSampleID", v25);
      v18 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = medicalRecordSampleID == (NSUUID *)v18;
      if (medicalRecordSampleID == (NSUUID *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        -[HKSignedClinicalDataItem medicalRecordSampleID](v5, "medicalRecordSampleID");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v12 = self->_medicalRecordSampleID;
          -[HKSignedClinicalDataItem medicalRecordSampleID](v5, "medicalRecordSampleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "isEqual:", v22);

          if (relevantDate == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }

      }
      if (relevantDate == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      v9 = v28;

      v23 = primaryConceptCodingCollection == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKMedicalCodingCollection description](self->_primaryConceptCodingCollection, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_relevantDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID description](self->_medicalRecordSampleID, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Primary concept coding collection: %@, relevantDate: %@, sample ID: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSignedClinicalDataItem)initWithCoder:(id)a3
{
  id v4;
  HKSignedClinicalDataItem *v5;
  uint64_t v6;
  HKMedicalCodingCollection *primaryConceptCodingCollection;
  uint64_t v8;
  HKConcept *primaryConcept;
  uint64_t v10;
  NSDate *relevantDate;
  uint64_t v12;
  NSUUID *medicalRecordSampleID;
  HKSignedClinicalDataItem *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKSignedClinicalDataItem;
  v5 = -[HKSignedClinicalDataItem init](&v16, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryConceptCodingCollection"));
  v6 = objc_claimAutoreleasedReturnValue();
  primaryConceptCodingCollection = v5->_primaryConceptCodingCollection;
  v5->_primaryConceptCodingCollection = (HKMedicalCodingCollection *)v6;

  if (!v5->_primaryConceptCodingCollection)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrimaryConcept"));
  v8 = objc_claimAutoreleasedReturnValue();
  primaryConcept = v5->_primaryConcept;
  v5->_primaryConcept = (HKConcept *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelevantDate"));
  v10 = objc_claimAutoreleasedReturnValue();
  relevantDate = v5->_relevantDate;
  v5->_relevantDate = (NSDate *)v10;

  if (!v5->_relevantDate)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicalRecordSampleID"));
  v12 = objc_claimAutoreleasedReturnValue();
  medicalRecordSampleID = v5->_medicalRecordSampleID;
  v5->_medicalRecordSampleID = (NSUUID *)v12;

  if (v5->_medicalRecordSampleID)
LABEL_5:
    v14 = v5;
  else
LABEL_6:
    v14 = 0;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicalCodingCollection *primaryConceptCodingCollection;
  id v5;

  primaryConceptCodingCollection = self->_primaryConceptCodingCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryConceptCodingCollection, CFSTR("PrimaryConceptCodingCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryConcept, CFSTR("PrimaryConcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantDate, CFSTR("RelevantDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicalRecordSampleID, CFSTR("MedicalRecordSampleID"));

}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v6;

  v6 = a4;
  +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v6, objc_opt_class());

  return 0;
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v5;

  v5 = a3;
  +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v5, objc_opt_class());

  return 0;
}

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (HKMedicalCodingCollection)primaryConceptCodingCollection
{
  return self->_primaryConceptCodingCollection;
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (NSUUID)medicalRecordSampleID
{
  return self->_medicalRecordSampleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalRecordSampleID, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_primaryConceptCodingCollection, 0);
  objc_storeStrong((id *)&self->_primaryConcept, 0);
}

@end
