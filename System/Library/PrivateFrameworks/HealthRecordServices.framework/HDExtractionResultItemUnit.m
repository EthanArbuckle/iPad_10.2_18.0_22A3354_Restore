@implementation HDExtractionResultItemUnit

- (HDExtractionResultItemUnit)initWithMedicalRecord:(id)a3 clinicalRecord:(id)a4 downloadableAttachments:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDExtractionResultItemUnit *v12;
  uint64_t v13;
  HKMedicalRecord *medicalRecord;
  uint64_t v15;
  HKClinicalRecord *clinicalRecord;
  uint64_t v17;
  NSArray *downloadableAttachments;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDExtractionResultItemUnit.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medicalRecord"));

  }
  v21.receiver = self;
  v21.super_class = (Class)HDExtractionResultItemUnit;
  v12 = -[HDExtractionResultItemUnit init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    medicalRecord = v12->_medicalRecord;
    v12->_medicalRecord = (HKMedicalRecord *)v13;

    v15 = objc_msgSend(v10, "copy");
    clinicalRecord = v12->_clinicalRecord;
    v12->_clinicalRecord = (HKClinicalRecord *)v15;

    v17 = objc_msgSend(v11, "copy");
    downloadableAttachments = v12->_downloadableAttachments;
    v12->_downloadableAttachments = (NSArray *)v17;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HDExtractionResultItemUnit *v4;
  HDExtractionResultItemUnit *v5;
  HKMedicalRecord *medicalRecord;
  HKMedicalRecord *v7;
  uint64_t v8;
  void *v9;
  HKMedicalRecord *v10;
  void *v11;
  void *v12;
  HKClinicalRecord *clinicalRecord;
  HKClinicalRecord *v14;
  HKClinicalRecord *v15;
  void *v16;
  NSArray *downloadableAttachments;
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

  v4 = (HDExtractionResultItemUnit *)a3;
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
      medicalRecord = self->_medicalRecord;
      -[HDExtractionResultItemUnit medicalRecord](v5, "medicalRecord");
      v7 = (HKMedicalRecord *)objc_claimAutoreleasedReturnValue();
      if (medicalRecord != v7)
      {
        -[HDExtractionResultItemUnit medicalRecord](v5, "medicalRecord");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        v9 = (void *)v8;
        v10 = self->_medicalRecord;
        -[HDExtractionResultItemUnit medicalRecord](v5, "medicalRecord");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKMedicalRecord isEqual:](v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      clinicalRecord = self->_clinicalRecord;
      -[HDExtractionResultItemUnit clinicalRecord](v5, "clinicalRecord");
      v14 = (HKClinicalRecord *)objc_claimAutoreleasedReturnValue();
      if (clinicalRecord != v14)
      {
        -[HDExtractionResultItemUnit clinicalRecord](v5, "clinicalRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
        v15 = self->_clinicalRecord;
        -[HDExtractionResultItemUnit clinicalRecord](v5, "clinicalRecord");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[HKClinicalRecord isEqual:](v15, "isEqual:", v16) & 1) == 0)
        {

          LOBYTE(v12) = 0;
LABEL_27:
          v23 = medicalRecord == v7;
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
      downloadableAttachments = self->_downloadableAttachments;
      -[HDExtractionResultItemUnit downloadableAttachments](v5, "downloadableAttachments", v25);
      v18 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = downloadableAttachments == (NSArray *)v18;
      if (downloadableAttachments == (NSArray *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        -[HDExtractionResultItemUnit downloadableAttachments](v5, "downloadableAttachments");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          v12 = self->_downloadableAttachments;
          -[HDExtractionResultItemUnit downloadableAttachments](v5, "downloadableAttachments");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "isEqualToArray:", v22);

          if (clinicalRecord == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }

      }
      if (clinicalRecord == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      v9 = v28;

      v23 = medicalRecord == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[HKMedicalRecord hash](self->_medicalRecord, "hash");
  v4 = -[HKClinicalRecord hash](self->_clinicalRecord, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_downloadableAttachments, "hash");
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, medical record: %@, clinical record: %@, downloadable attachments: %lu>"), v5, self, v6, v7, -[NSArray count](self->_downloadableAttachments, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResultItemUnit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDExtractionResultItemUnit *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicalRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clinicalRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("downloadableAttachments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDExtractionResultItemUnit initWithMedicalRecord:clinicalRecord:downloadableAttachments:](self, "initWithMedicalRecord:clinicalRecord:downloadableAttachments:", v5, v6, v8);

    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicalRecord *medicalRecord;
  id v5;

  medicalRecord = self->_medicalRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", medicalRecord, CFSTR("medicalRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clinicalRecord, CFSTR("clinicalRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloadableAttachments, CFSTR("downloadableAttachments"));

}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (HKClinicalRecord)clinicalRecord
{
  return self->_clinicalRecord;
}

- (NSArray)downloadableAttachments
{
  return self->_downloadableAttachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadableAttachments, 0);
  objc_storeStrong((id *)&self->_clinicalRecord, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

@end
