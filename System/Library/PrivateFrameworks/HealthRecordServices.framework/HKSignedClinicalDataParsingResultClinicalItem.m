@implementation HKSignedClinicalDataParsingResultClinicalItem

- (HKSignedClinicalDataParsingResultClinicalItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4 verifiableClinicalRecord:(id)a5 medicalRecords:(id)a6 clinicalRecords:(id)a7
{
  id v12;
  id v13;
  id v14;
  HKSignedClinicalDataParsingResultClinicalItem *v15;
  uint64_t v16;
  HKVerifiableClinicalRecord *verifiableClinicalRecord;
  uint64_t v18;
  NSArray *medicalRecords;
  uint64_t v20;
  NSArray *clinicalRecords;
  objc_super v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  v15 = -[HKSignedClinicalDataParsingResultItem initWithOriginalRecord:mainRecord:](&v23, sel_initWithOriginalRecord_mainRecord_, a3, a4);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    verifiableClinicalRecord = v15->_verifiableClinicalRecord;
    v15->_verifiableClinicalRecord = (HKVerifiableClinicalRecord *)v16;

    v18 = objc_msgSend(v13, "copy");
    medicalRecords = v15->_medicalRecords;
    v15->_medicalRecords = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    clinicalRecords = v15->_clinicalRecords;
    v15->_clinicalRecords = (NSArray *)v20;

  }
  return v15;
}

- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOriginalRecord:mainRecord:verifiableClinicalRecord:medicalRecords:clinicalRecords:", v7, v6, self->_verifiableClinicalRecord, self->_medicalRecords, self->_clinicalRecords);

  return v8;
}

- (id)uniquenessChecksum
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  -[HKSignedClinicalDataParsingResultItem originalRecord](self, "originalRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sourceType");

  if (v4 == 2)
  {
    -[HKSignedClinicalDataParsingResultItem originalRecord](self, "originalRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_MD5");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray hk_map:](self->_clinicalRecords, "hk_map:", &__block_literal_global_1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_185);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_map:", &__block_literal_global_187);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    -[HKSignedClinicalDataParsingResultItem mainRecord](self, "mainRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "issuerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v9, "addObject:", v12);
    -[HKSignedClinicalDataParsingResultItem mainRecord](self, "mainRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataForUniquenessChecksumCalculation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v9, "addObject:", v15);
    objc_msgSend(v9, "hk_map:", &__block_literal_global_189);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    objc_msgSend(v16, "hk_foldRightFrom:with:", v17, &__block_literal_global_191);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "hk_MD5");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "FHIRResource");
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "resourceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_MD5");
}

id __67__HKSignedClinicalDataParsingResultClinicalItem_uniquenessChecksum__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "appendData:", v4);

  return v5;
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
  v5.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  v4 = a3;
  -[HKSignedClinicalDataParsingResultItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_verifiableClinicalRecord, CFSTR("VerifiableClinicalRecord"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_medicalRecords, CFSTR("MedicalRecords"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clinicalRecords, CFSTR("ClinicalRecords"));

}

- (HKSignedClinicalDataParsingResultClinicalItem)initWithCoder:(id)a3
{
  id v4;
  HKSignedClinicalDataParsingResultClinicalItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HKSignedClinicalDataParsingResultClinicalItem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  v5 = -[HKSignedClinicalDataParsingResultItem initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VerifiableClinicalRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("MedicalRecords"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
        v9 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ClinicalRecords"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_storeStrong((id *)&v5->_verifiableClinicalRecord, v6);
          objc_storeStrong((id *)&v5->_medicalRecords, v8);
          objc_storeStrong((id *)&v5->_clinicalRecords, v10);
          v11 = v5;
        }
        else
        {
          objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
          v11 = 0;
        }

        v7 = (void *)v9;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v11 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKSignedClinicalDataParsingResultClinicalItem *v4;
  HKSignedClinicalDataParsingResultClinicalItem *v5;
  HKSignedClinicalDataParsingResultClinicalItem *v6;
  HKVerifiableClinicalRecord *verifiableClinicalRecord;
  HKVerifiableClinicalRecord *v8;
  uint64_t v9;
  void *v10;
  HKVerifiableClinicalRecord *v11;
  void *v12;
  void *v13;
  NSArray *medicalRecords;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  NSArray *clinicalRecords;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  HKVerifiableClinicalRecord *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v4 = (HKSignedClinicalDataParsingResultClinicalItem *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!-[HKSignedClinicalDataParsingResultClinicalItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class())|| (v31.receiver = self, v31.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem, !-[HKSignedClinicalDataParsingResultItem isEqual:](&v31, sel_isEqual_, v6)))
    {
      LOBYTE(v13) = 0;
LABEL_35:

      goto LABEL_36;
    }
    verifiableClinicalRecord = self->_verifiableClinicalRecord;
    -[HKSignedClinicalDataParsingResultClinicalItem verifiableClinicalRecord](v6, "verifiableClinicalRecord");
    v8 = (HKVerifiableClinicalRecord *)objc_claimAutoreleasedReturnValue();
    if (verifiableClinicalRecord != v8)
    {
      -[HKSignedClinicalDataParsingResultClinicalItem verifiableClinicalRecord](v6, "verifiableClinicalRecord");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        LOBYTE(v13) = 0;
        goto LABEL_34;
      }
      v10 = (void *)v9;
      v11 = self->_verifiableClinicalRecord;
      -[HKSignedClinicalDataParsingResultClinicalItem verifiableClinicalRecord](v6, "verifiableClinicalRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKVerifiableClinicalRecord isEqual:](v11, "isEqual:", v12))
      {
        LOBYTE(v13) = 0;
LABEL_33:

        goto LABEL_34;
      }
      v29 = v12;
      v30 = v10;
    }
    medicalRecords = self->_medicalRecords;
    -[HKSignedClinicalDataParsingResultClinicalItem medicalRecords](v6, "medicalRecords");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (medicalRecords == v15)
    {
      v28 = verifiableClinicalRecord;
    }
    else
    {
      -[HKSignedClinicalDataParsingResultClinicalItem medicalRecords](v6, "medicalRecords");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v12 = v29;
        v10 = v30;
        goto LABEL_27;
      }
      v16 = self->_medicalRecords;
      -[HKSignedClinicalDataParsingResultClinicalItem medicalRecords](v6, "medicalRecords");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSArray isEqualToArray:](v16, "isEqualToArray:", v17))
      {

        LOBYTE(v13) = 0;
        v24 = verifiableClinicalRecord == v8;
        goto LABEL_32;
      }
      v26 = v17;
      v27 = v13;
      v28 = verifiableClinicalRecord;
    }
    clinicalRecords = self->_clinicalRecords;
    -[HKSignedClinicalDataParsingResultClinicalItem clinicalRecords](v6, "clinicalRecords");
    v19 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = clinicalRecords == (NSArray *)v19;
    if (clinicalRecords == (NSArray *)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      -[HKSignedClinicalDataParsingResultClinicalItem clinicalRecords](v6, "clinicalRecords");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v13 = self->_clinicalRecords;
        -[HKSignedClinicalDataParsingResultClinicalItem clinicalRecords](v6, "clinicalRecords");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v13, "isEqualToArray:", v23);

        if (medicalRecords == v15)
        {

          goto LABEL_31;
        }

LABEL_29:
LABEL_31:
        v24 = v28 == v8;
LABEL_32:
        v12 = v29;
        v10 = v30;
        if (!v24)
          goto LABEL_33;
LABEL_34:

        goto LABEL_35;
      }

    }
    if (medicalRecords == v15)
      goto LABEL_29;

    v12 = v29;
    v10 = v30;
    verifiableClinicalRecord = v28;
LABEL_27:

    if (verifiableClinicalRecord == v8)
      goto LABEL_34;
    goto LABEL_33;
  }
  LOBYTE(v13) = 1;
LABEL_36:

  return (char)v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKSignedClinicalDataParsingResultClinicalItem;
  v3 = -[HKSignedClinicalDataParsingResultItem hash](&v7, sel_hash);
  v4 = -[HKVerifiableClinicalRecord hash](self->_verifiableClinicalRecord, "hash") ^ v3;
  v5 = -[NSArray hash](self->_medicalRecords, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_clinicalRecords, "hash");
}

- (HKVerifiableClinicalRecord)verifiableClinicalRecord
{
  return self->_verifiableClinicalRecord;
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (NSArray)clinicalRecords
{
  return self->_clinicalRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);
  objc_storeStrong((id *)&self->_verifiableClinicalRecord, 0);
}

@end
