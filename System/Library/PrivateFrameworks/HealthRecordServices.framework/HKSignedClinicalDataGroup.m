@implementation HKSignedClinicalDataGroup

- (HKSignedClinicalDataGroup)init
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

- (HKSignedClinicalDataGroup)initWithOptions:(unint64_t)a3 mainRecord:(id)a4 medicalRecords:(id)a5 clinicalRecords:(id)a6 QRRepresentation:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKSignedClinicalDataGroup *v16;
  HKSignedClinicalDataGroup *v17;
  uint64_t v18;
  HKSignedClinicalDataRecord *mainRecord;
  uint64_t v20;
  NSArray *medicalRecords;
  uint64_t v22;
  NSArray *clinicalRecords;
  uint64_t v24;
  HKSignedClinicalDataQRRepresentation *QRRepresentation;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HKSignedClinicalDataGroup;
  v16 = -[HKSignedClinicalDataGroup init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_options = a3;
    v18 = objc_msgSend(v12, "copy");
    mainRecord = v17->_mainRecord;
    v17->_mainRecord = (HKSignedClinicalDataRecord *)v18;

    v20 = objc_msgSend(v13, "copy");
    medicalRecords = v17->_medicalRecords;
    v17->_medicalRecords = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    clinicalRecords = v17->_clinicalRecords;
    v17->_clinicalRecords = (NSArray *)v22;

    v24 = objc_msgSend(v15, "copy");
    QRRepresentation = v17->_QRRepresentation;
    v17->_QRRepresentation = (HKSignedClinicalDataQRRepresentation *)v24;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKSignedClinicalDataGroup *v5;
  HKSignedClinicalDataGroup *v6;
  HKSignedClinicalDataGroup *v7;
  unint64_t options;
  HKSignedClinicalDataRecord *mainRecord;
  HKSignedClinicalDataRecord *v10;
  uint64_t v11;
  HKSignedClinicalDataRecord *v12;
  void *v13;
  void *v14;
  NSArray *medicalRecords;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  NSArray *clinicalRecords;
  NSArray *v20;
  NSArray *v21;
  uint64_t v22;
  NSArray *v23;
  void *v24;
  HKSignedClinicalDataQRRepresentation *QRRepresentation;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  NSArray *v39;
  void *v40;

  v5 = (HKSignedClinicalDataGroup *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (options = self->_options, options != -[HKSignedClinicalDataGroup options](v7, "options")))
    {
      LOBYTE(v14) = 0;
LABEL_39:

      goto LABEL_40;
    }
    mainRecord = self->_mainRecord;
    -[HKSignedClinicalDataGroup mainRecord](v7, "mainRecord");
    v10 = (HKSignedClinicalDataRecord *)objc_claimAutoreleasedReturnValue();
    if (mainRecord != v10)
    {
      -[HKSignedClinicalDataGroup mainRecord](v7, "mainRecord");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        LOBYTE(v14) = 0;
        goto LABEL_38;
      }
      v3 = (void *)v11;
      v12 = self->_mainRecord;
      -[HKSignedClinicalDataGroup mainRecord](v7, "mainRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKSignedClinicalDataRecord isEqual:](v12, "isEqual:", v13))
      {
        LOBYTE(v14) = 0;
LABEL_37:

        goto LABEL_38;
      }
      v40 = v13;
    }
    medicalRecords = self->_medicalRecords;
    -[HKSignedClinicalDataGroup medicalRecords](v7, "medicalRecords");
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (medicalRecords == v16)
    {
      v39 = medicalRecords;
    }
    else
    {
      -[HKSignedClinicalDataGroup medicalRecords](v7, "medicalRecords");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_35;
      v39 = medicalRecords;
      v17 = self->_medicalRecords;
      -[HKSignedClinicalDataGroup medicalRecords](v7, "medicalRecords");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSArray isEqualToArray:](v17, "isEqualToArray:", v18))
      {

        LOBYTE(v14) = 0;
        goto LABEL_36;
      }
      v35 = v18;
      v36 = v14;
    }
    clinicalRecords = self->_clinicalRecords;
    -[HKSignedClinicalDataGroup clinicalRecords](v7, "clinicalRecords");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (clinicalRecords == v20)
    {
      v37 = v3;
      v38 = clinicalRecords;
    }
    else
    {
      -[HKSignedClinicalDataGroup clinicalRecords](v7, "clinicalRecords");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_32:

LABEL_33:
        if (v39 != v16)
        {
LABEL_34:

        }
LABEL_35:

LABEL_36:
        v13 = v40;
        if (mainRecord != v10)
          goto LABEL_37;
LABEL_38:

        goto LABEL_39;
      }
      v38 = clinicalRecords;
      v21 = self->_clinicalRecords;
      -[HKSignedClinicalDataGroup clinicalRecords](v7, "clinicalRecords");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = (void *)v22;
      if (!-[NSArray isEqualToArray:](v23, "isEqualToArray:", v22))
      {

        LOBYTE(v14) = 0;
        goto LABEL_33;
      }
      v32 = v24;
      v34 = v14;
      v37 = v3;
    }
    QRRepresentation = self->_QRRepresentation;
    -[HKSignedClinicalDataGroup QRRepresentation](v7, "QRRepresentation", v32);
    v26 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v26;
    if (QRRepresentation == (HKSignedClinicalDataQRRepresentation *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[HKSignedClinicalDataGroup QRRepresentation](v7, "QRRepresentation");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        v14 = self->_QRRepresentation;
        -[HKSignedClinicalDataGroup QRRepresentation](v7, "QRRepresentation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v14, "isEqual:", v30);

        if (v38 == v20)
        {

LABEL_43:
          v3 = v37;
          if (v39 == v16)
            goto LABEL_35;
          goto LABEL_34;
        }

LABEL_41:
        goto LABEL_43;
      }

    }
    if (v38 == v20)
      goto LABEL_41;

    v3 = v37;
    goto LABEL_32;
  }
  LOBYTE(v14) = 1;
LABEL_40:

  return (char)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t options;
  id v5;

  options = self->_options;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainRecord, CFSTR("mainRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicalRecords, CFSTR("medicalRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clinicalRecords, CFSTR("clinicalRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_QRRepresentation, CFSTR("QRRepresentation"));

}

- (HKSignedClinicalDataGroup)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKSignedClinicalDataGroup *v12;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("options")) & 1) != 0)
  {
    v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("medicalRecords"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("clinicalRecords"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QRRepresentation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKSignedClinicalDataGroup initWithOptions:mainRecord:medicalRecords:clinicalRecords:QRRepresentation:](self, "initWithOptions:mainRecord:medicalRecords:clinicalRecords:QRRepresentation:", v5, v6, v8, v10, v11);

    v12 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v12 = 0;
  }

  return v12;
}

- (unint64_t)options
{
  return self->_options;
}

- (HKSignedClinicalDataRecord)mainRecord
{
  return self->_mainRecord;
}

- (NSArray)medicalRecords
{
  return self->_medicalRecords;
}

- (NSArray)clinicalRecords
{
  return self->_clinicalRecords;
}

- (HKSignedClinicalDataQRRepresentation)QRRepresentation
{
  return self->_QRRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRRepresentation, 0);
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
  objc_storeStrong((id *)&self->_medicalRecords, 0);
  objc_storeStrong((id *)&self->_mainRecord, 0);
}

@end
