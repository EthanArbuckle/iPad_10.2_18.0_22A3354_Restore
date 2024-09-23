@implementation HKClinicalDocumentSpotlightSearchResult

- (HKClinicalDocumentSpotlightSearchResult)init
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

- (HKClinicalDocumentSpotlightSearchResult)initWithTitle:(id)a3 medicalRecord:(id)a4 attachmentUUID:(id)a5 previewString:(id)a6 previewStringMatchRanges:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKClinicalDocumentSpotlightSearchResult *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  HKMedicalRecord *medicalRecord;
  uint64_t v22;
  NSUUID *attachmentUUID;
  uint64_t v24;
  NSString *previewString;
  uint64_t v26;
  NSArray *previewStringMatchRanges;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKClinicalDocumentSpotlightSearchResult;
  v17 = -[HKClinicalDocumentSpotlightSearchResult init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    medicalRecord = v17->_medicalRecord;
    v17->_medicalRecord = (HKMedicalRecord *)v20;

    v22 = objc_msgSend(v14, "copy");
    attachmentUUID = v17->_attachmentUUID;
    v17->_attachmentUUID = (NSUUID *)v22;

    v24 = objc_msgSend(v15, "copy");
    previewString = v17->_previewString;
    v17->_previewString = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    previewStringMatchRanges = v17->_previewStringMatchRanges;
    v17->_previewStringMatchRanges = (NSArray *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKClinicalDocumentSpotlightSearchResult *v5;
  HKClinicalDocumentSpotlightSearchResult *v6;
  NSString *title;
  NSString *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  char v13;
  HKMedicalRecord *medicalRecord;
  HKMedicalRecord *v15;
  uint64_t v16;
  HKMedicalRecord *v17;
  NSUUID *attachmentUUID;
  NSUUID *v19;
  uint64_t v20;
  NSUUID *v21;
  NSUUID *v22;
  uint64_t v23;
  NSUUID *v24;
  void *v25;
  HKMedicalRecord *v26;
  NSString *previewString;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  NSArray *previewStringMatchRanges;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSArray *v40;
  void *v41;
  NSUUID *v42;
  NSUUID *v43;
  void *v45;
  void *v46;
  void *v47;
  NSString *v48;
  NSUUID *v49;
  NSString *v50;
  void *v51;
  void *v52;
  HKMedicalRecord *v53;
  NSUUID *v54;
  void *v55;
  void *v56;
  void *v57;

  v5 = (HKClinicalDocumentSpotlightSearchResult *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      title = self->_title;
      -[HKClinicalDocumentSpotlightSearchResult title](v6, "title");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (title != v8)
      {
        -[HKClinicalDocumentSpotlightSearchResult title](v6, "title");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        v11 = self->_title;
        -[HKClinicalDocumentSpotlightSearchResult title](v6, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v11, "isEqualToString:", v12))
        {
          v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v57 = v10;
        v56 = v12;
      }
      medicalRecord = self->_medicalRecord;
      -[HKClinicalDocumentSpotlightSearchResult medicalRecord](v6, "medicalRecord");
      v15 = (HKMedicalRecord *)objc_claimAutoreleasedReturnValue();
      if (medicalRecord != v15)
      {
        -[HKClinicalDocumentSpotlightSearchResult medicalRecord](v6, "medicalRecord");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
LABEL_32:

LABEL_33:
          v13 = 0;
          goto LABEL_50;
        }
        v55 = (void *)v16;
        v17 = self->_medicalRecord;
        -[HKClinicalDocumentSpotlightSearchResult medicalRecord](v6, "medicalRecord");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[HKMedicalRecord isEqual:](v17, "isEqual:", v3) & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
      }
      attachmentUUID = self->_attachmentUUID;
      -[HKClinicalDocumentSpotlightSearchResult attachmentUUID](v6, "attachmentUUID");
      v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      v54 = attachmentUUID;
      if (attachmentUUID == v19)
      {
        v53 = medicalRecord;
        v26 = v15;
      }
      else
      {
        -[HKClinicalDocumentSpotlightSearchResult attachmentUUID](v6, "attachmentUUID");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v52 = v3;
          v13 = 0;
          goto LABEL_47;
        }
        v51 = (void *)v20;
        v53 = medicalRecord;
        v21 = v19;
        v22 = self->_attachmentUUID;
        -[HKClinicalDocumentSpotlightSearchResult attachmentUUID](v6, "attachmentUUID");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v25 = (void *)v23;
        if ((-[NSUUID isEqual:](v24, "isEqual:", v23) & 1) == 0)
        {

          if (medicalRecord == v15)
          {

            goto LABEL_33;
          }
          goto LABEL_31;
        }
        v26 = v15;
        v47 = v25;
        v19 = v21;
      }
      previewString = self->_previewString;
      -[HKClinicalDocumentSpotlightSearchResult previewString](v6, "previewString");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v50 = previewString;
      v52 = v3;
      if (previewString == (NSString *)v28)
      {
        v48 = (NSString *)v28;
        v49 = v19;
        v15 = v26;
      }
      else
      {
        -[HKClinicalDocumentSpotlightSearchResult previewString](v6, "previewString");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          v13 = 0;
          v15 = v26;
          medicalRecord = v53;
          v42 = v54;
          goto LABEL_37;
        }
        v46 = (void *)v30;
        v49 = v19;
        v31 = self->_previewString;
        -[HKClinicalDocumentSpotlightSearchResult previewString](v6, "previewString");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v34 = (void *)v32;
        v15 = v26;
        if (!-[NSString isEqualToString:](v33, "isEqualToString:", v32))
        {

          v13 = 0;
          v19 = v49;
          medicalRecord = v53;
          v43 = v54;
          goto LABEL_45;
        }
        v45 = v34;
        v48 = (NSString *)v29;
      }
      previewStringMatchRanges = self->_previewStringMatchRanges;
      -[HKClinicalDocumentSpotlightSearchResult previewStringMatchRanges](v6, "previewStringMatchRanges");
      v36 = objc_claimAutoreleasedReturnValue();
      v13 = previewStringMatchRanges == (NSArray *)v36;
      if (previewStringMatchRanges == (NSArray *)v36)
      {

        v29 = v48;
        medicalRecord = v53;
        if (v50 == v48)
          goto LABEL_41;
      }
      else
      {
        v37 = (void *)v36;
        -[HKClinicalDocumentSpotlightSearchResult previewStringMatchRanges](v6, "previewStringMatchRanges");
        v38 = objc_claimAutoreleasedReturnValue();
        medicalRecord = v53;
        if (v38)
        {
          v39 = (void *)v38;
          v40 = self->_previewStringMatchRanges;
          -[HKClinicalDocumentSpotlightSearchResult previewStringMatchRanges](v6, "previewStringMatchRanges");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSArray isEqual:](v40, "isEqual:", v41);

          if (v50 == v48)
          {

          }
          else
          {

          }
          goto LABEL_44;
        }

        v29 = v48;
        if (v50 == v48)
        {
LABEL_41:

LABEL_44:
          v19 = v49;
          v43 = v54;
LABEL_45:
          if (v43 != v19)
          {
LABEL_46:

          }
LABEL_47:

          if (medicalRecord != v15)
          {

          }
LABEL_50:
          v12 = v56;
          v10 = v57;
          if (title != v8)
            goto LABEL_51;
LABEL_52:

          goto LABEL_53;
        }
      }

      v19 = v49;
      v42 = v54;
LABEL_37:

      if (v42 == v19)
        goto LABEL_47;
      goto LABEL_46;
    }
    v13 = 0;
  }
LABEL_53:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[HKMedicalRecord hash](self->_medicalRecord, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_attachmentUUID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_previewString, "hash");
  return v6 ^ -[NSArray hash](self->_previewStringMatchRanges, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalDocumentSpotlightSearchResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKClinicalDocumentSpotlightSearchResult *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicalRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreviewString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("PreviewStringMatchRanges"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v6 && v7)
  {
    self = -[HKClinicalDocumentSpotlightSearchResult initWithTitle:medicalRecord:attachmentUUID:previewString:previewStringMatchRanges:](self, "initWithTitle:medicalRecord:attachmentUUID:previewString:previewStringMatchRanges:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("Title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previewString, CFSTR("PreviewString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentUUID, CFSTR("AttachmentUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicalRecord, CFSTR("MedicalRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previewStringMatchRanges, CFSTR("PreviewStringMatchRanges"));

}

- (NSString)title
{
  return self->_title;
}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (NSUUID)attachmentUUID
{
  return self->_attachmentUUID;
}

- (NSString)previewString
{
  return self->_previewString;
}

- (NSArray)previewStringMatchRanges
{
  return self->_previewStringMatchRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewStringMatchRanges, 0);
  objc_storeStrong((id *)&self->_previewString, 0);
  objc_storeStrong((id *)&self->_attachmentUUID, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
