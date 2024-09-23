@implementation HKSignedClinicalDataParsingResultItem

- (HKSignedClinicalDataParsingResultItem)init
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

- (HKSignedClinicalDataParsingResultItem)initWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v6;
  id v7;
  HKSignedClinicalDataParsingResultItem *v8;
  uint64_t v9;
  HDHRSOriginalSignedClinicalDataRecord *originalRecord;
  uint64_t v11;
  HKSignedClinicalDataRecord *mainRecord;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKSignedClinicalDataParsingResultItem;
  v8 = -[HKSignedClinicalDataParsingResultItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    originalRecord = v8->_originalRecord;
    v8->_originalRecord = (HDHRSOriginalSignedClinicalDataRecord *)v9;

    v11 = objc_msgSend(v7, "copy");
    mainRecord = v8->_mainRecord;
    v8->_mainRecord = (HKSignedClinicalDataRecord *)v11;

  }
  return v8;
}

- (id)copyWithOriginalRecord:(id)a3 mainRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOriginalRecord:mainRecord:", v6, v5);

  return v7;
}

- (NSData)uniquenessChecksum
{
  void *v2;
  void *v3;

  -[HDHRSOriginalSignedClinicalDataRecord rawContent](self->_originalRecord, "rawContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_MD5");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HDHRSOriginalSignedClinicalDataRecord *originalRecord;
  id v5;

  originalRecord = self->_originalRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalRecord, CFSTR("OriginalRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainRecord, CFSTR("MainRecord"));

}

- (HKSignedClinicalDataParsingResultItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKSignedClinicalDataParsingResultItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginalRecord"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MainRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[HKSignedClinicalDataParsingResultItem initWithOriginalRecord:mainRecord:](self, "initWithOriginalRecord:mainRecord:", v5, v6);
      v7 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v7 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKSignedClinicalDataParsingResultItem *v6;
  HKSignedClinicalDataParsingResultItem *v7;
  HKSignedClinicalDataParsingResultItem *v8;
  HDHRSOriginalSignedClinicalDataRecord *originalRecord;
  HDHRSOriginalSignedClinicalDataRecord *v10;
  uint64_t v11;
  HDHRSOriginalSignedClinicalDataRecord *v12;
  char v13;
  HKSignedClinicalDataRecord *mainRecord;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HKSignedClinicalDataRecord *v19;
  void *v20;

  v6 = (HKSignedClinicalDataParsingResultItem *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    if (!-[HKSignedClinicalDataParsingResultItem isMemberOfClass:](v8, "isMemberOfClass:", objc_opt_class()))
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    originalRecord = self->_originalRecord;
    -[HKSignedClinicalDataParsingResultItem originalRecord](v8, "originalRecord");
    v10 = (HDHRSOriginalSignedClinicalDataRecord *)objc_claimAutoreleasedReturnValue();
    if (originalRecord == v10)
      goto LABEL_9;
    -[HKSignedClinicalDataParsingResultItem originalRecord](v8, "originalRecord");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v3 = (void *)v11;
    v12 = self->_originalRecord;
    -[HKSignedClinicalDataParsingResultItem originalRecord](v8, "originalRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HDHRSOriginalSignedClinicalDataRecord isEqual:](v12, "isEqual:", v4))
    {
LABEL_9:
      mainRecord = self->_mainRecord;
      -[HKSignedClinicalDataParsingResultItem mainRecord](v8, "mainRecord");
      v15 = objc_claimAutoreleasedReturnValue();
      if (mainRecord == (HKSignedClinicalDataRecord *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKSignedClinicalDataParsingResultItem mainRecord](v8, "mainRecord");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_mainRecord;
          -[HKSignedClinicalDataParsingResultItem mainRecord](v8, "mainRecord");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[HKSignedClinicalDataRecord isEqual:](v19, "isEqual:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (originalRecord == v10)
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

  v3 = -[HDHRSOriginalSignedClinicalDataRecord hash](self->_originalRecord, "hash");
  return -[HKSignedClinicalDataRecord hash](self->_mainRecord, "hash") ^ v3;
}

- (HDHRSOriginalSignedClinicalDataRecord)originalRecord
{
  return self->_originalRecord;
}

- (HKSignedClinicalDataRecord)mainRecord
{
  return self->_mainRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainRecord, 0);
  objc_storeStrong((id *)&self->_originalRecord, 0);
}

@end
