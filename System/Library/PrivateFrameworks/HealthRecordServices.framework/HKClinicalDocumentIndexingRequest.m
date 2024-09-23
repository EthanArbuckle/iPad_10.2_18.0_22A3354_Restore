@implementation HKClinicalDocumentIndexingRequest

- (HKClinicalDocumentIndexingRequest)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalDocumentIndexingRequest)initWithMedicalRecord:(id)a3 attachmentIdentifiers:(id)a4
{
  id v6;
  id v7;
  HKClinicalDocumentIndexingRequest *v8;
  uint64_t v9;
  HKMedicalRecord *medicalRecord;
  uint64_t v11;
  NSArray *attachmentIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalDocumentIndexingRequest;
  v8 = -[HKClinicalDocumentIndexingRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    medicalRecord = v8->_medicalRecord;
    v8->_medicalRecord = (HKMedicalRecord *)v9;

    v11 = objc_msgSend(v7, "copy");
    attachmentIdentifiers = v8->_attachmentIdentifiers;
    v8->_attachmentIdentifiers = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalDocumentIndexingRequest *v6;
  HKClinicalDocumentIndexingRequest *v7;
  HKClinicalDocumentIndexingRequest *v8;
  HKMedicalRecord *medicalRecord;
  HKMedicalRecord *v10;
  uint64_t v11;
  HKMedicalRecord *v12;
  char v13;
  NSArray *attachmentIdentifiers;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  void *v20;

  v6 = (HKClinicalDocumentIndexingRequest *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    medicalRecord = self->_medicalRecord;
    -[HKClinicalDocumentIndexingRequest medicalRecord](v8, "medicalRecord");
    v10 = (HKMedicalRecord *)objc_claimAutoreleasedReturnValue();
    if (medicalRecord == v10)
      goto LABEL_9;
    -[HKClinicalDocumentIndexingRequest medicalRecord](v8, "medicalRecord");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_medicalRecord;
    -[HKClinicalDocumentIndexingRequest medicalRecord](v8, "medicalRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKMedicalRecord isEqual:](v12, "isEqual:", v4))
    {
LABEL_9:
      attachmentIdentifiers = self->_attachmentIdentifiers;
      -[HKClinicalDocumentIndexingRequest attachmentIdentifiers](v8, "attachmentIdentifiers");
      v15 = objc_claimAutoreleasedReturnValue();
      if (attachmentIdentifiers == (NSArray *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKClinicalDocumentIndexingRequest attachmentIdentifiers](v8, "attachmentIdentifiers");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_attachmentIdentifiers;
          -[HKClinicalDocumentIndexingRequest attachmentIdentifiers](v8, "attachmentIdentifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSArray isEqualToArray:](v19, "isEqualToArray:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (medicalRecord == v10)
        goto LABEL_17;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_17;
  }
  v13 = 1;
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[HKMedicalRecord hash](self->_medicalRecord, "hash");
  return -[NSArray hash](self->_attachmentIdentifiers, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicalRecord *medicalRecord;
  id v5;

  medicalRecord = self->_medicalRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", medicalRecord, CFSTR("MedicalRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentIdentifiers, CFSTR("AttachmentIdentifiers"));

}

- (HKClinicalDocumentIndexingRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  HKClinicalDocumentIndexingRequest *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicalRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentIdentifiers"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }
  else
  {
    self = -[HKClinicalDocumentIndexingRequest initWithMedicalRecord:attachmentIdentifiers:](self, "initWithMedicalRecord:attachmentIdentifiers:", v5, v6);
    v9 = self;
  }

  return v9;
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (NSArray)attachmentIdentifiers
{
  return self->_attachmentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

@end
