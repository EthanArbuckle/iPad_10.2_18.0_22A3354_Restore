@implementation HKSignedClinicalDataRecord

+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newSignedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           0));
}

+ (id)_newSignedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 credentialTypes:(id)a15 issuerIdentifier:(id)a16 issuedDate:(id)a17 relevantDate:(id)a18 expirationDate:(id)a19 signatureStatus:(int64_t)a20 subject:(id)a21 items:(id)a22 dataValue:(id)a23 sourceType:(int64_t)a24 config:(id)a25
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _BOOL4 v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;
  _QWORD aBlock[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  int64_t v73;
  int64_t v74;

  v56 = a5;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v30 = a21;
  v31 = a22;
  v32 = a23;
  v33 = a25;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __311__HKSignedClinicalDataRecord__newSignedClinicalDataRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_credentialTypes_issuerIdentifier_issuedDate_relevantDate_expirationDate_signatureStatus_subject_items_dataValue_sourceType_config___block_invoke;
  aBlock[3] = &unk_1E37EA8A8;
  v64 = v25;
  v65 = v26;
  v66 = v27;
  v67 = v28;
  v68 = v29;
  v69 = v30;
  v70 = v31;
  v71 = v32;
  v73 = a20;
  v74 = a24;
  v72 = v33;
  v61 = v33;
  v60 = v32;
  v59 = v31;
  v58 = v30;
  v55 = v29;
  v54 = v28;
  v53 = v27;
  v52 = v26;
  v51 = v25;
  v34 = a13;
  v35 = a12;
  v36 = a11;
  v37 = a10;
  v38 = a8;
  v39 = a7;
  v40 = a6;
  v41 = a4;
  v42 = a3;
  v43 = _Block_copy(aBlock);
  v62.receiver = a1;
  v62.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  v57 = objc_msgSendSuper2(&v62, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v42, v41, v56, v40, v39, v38, a9, v37, v36, v35, v34, a14, v43);

  return v57;
}

void __311__HKSignedClinicalDataRecord__newSignedClinicalDataRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_credentialTypes_issuerIdentifier_issuedDate_relevantDate_expirationDate_signatureStatus_subject_items_dataValue_sourceType_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;

  v21 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v21[22];
  v21[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v21[23];
  v21[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v21[24];
  v21[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v21[25];
  v21[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v21[26];
  v21[26] = v11;

  v21[27] = *(_QWORD *)(a1 + 104);
  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v21[28];
  v21[28] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v21[29];
  v21[29] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v21[30];
  v21[30] = v17;

  v19 = v21;
  v21[31] = *(_QWORD *)(a1 + 112);
  v20 = *(_QWORD *)(a1 + 96);
  if (v20)
  {
    (*(void (**)(uint64_t, _QWORD *))(v20 + 16))(v20, v21);
    v19 = v21;
  }

}

- (HKSignedClinicalDataRecord)init
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

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKSignedClinicalDataRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@credentialTypes = %@issuerIdentifier = %@issuedDate = %@relevantDate = %@expirationDate = %@signatureStatus = %ldsubject = %@items = %@dataValue = %@sourceType = %ld>"), v5, self, v6, self->_credentialTypes, self->_issuerIdentifier, self->_issuedDate, self->_relevantDate, self->_expirationDate, self->_signatureStatus, self->_subject, self->_items, self->_dataValue, self->_sourceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
  v5.super_class = (Class)HKSignedClinicalDataRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialTypes, CFSTR("CredentialTypes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("IssuerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuedDate, CFSTR("IssuedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relevantDate, CFSTR("RelevantDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_signatureStatus, CFSTR("SignatureStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("Subject"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_items, CFSTR("Items"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataValue, CFSTR("DataValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sourceType, CFSTR("SourceType"));

}

- (HKSignedClinicalDataRecord)initWithCoder:(id)a3
{
  id v4;
  HKSignedClinicalDataRecord *v5;
  void *v6;
  uint64_t v7;
  NSArray *credentialTypes;
  uint64_t v9;
  NSString *issuerIdentifier;
  uint64_t v11;
  NSDate *issuedDate;
  uint64_t v13;
  NSDate *relevantDate;
  uint64_t v15;
  NSDate *expirationDate;
  uint64_t v17;
  HKSignedClinicalDataSubject *subject;
  void *v19;
  uint64_t v20;
  NSArray *items;
  uint64_t v22;
  NSData *dataValue;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKSignedClinicalDataRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("CredentialTypes"));
    v7 = objc_claimAutoreleasedReturnValue();
    credentialTypes = v5->_credentialTypes;
    v5->_credentialTypes = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssuerIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssuedDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    issuedDate = v5->_issuedDate;
    v5->_issuedDate = (NSDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelevantDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    relevantDate = v5->_relevantDate;
    v5->_relevantDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

    v5->_signatureStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SignatureStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subject"));
    v17 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (HKSignedClinicalDataSubject *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("Items"));
    v20 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataValue"));
    v22 = objc_claimAutoreleasedReturnValue();
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v22;

    v5->_sourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SourceType"));
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  int64_t v59;
  objc_super v60;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v60.receiver = self;
    v60.super_class = (Class)HKSignedClinicalDataRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v60, sel_isEquivalent_, v5))
      goto LABEL_45;
    -[HKSignedClinicalDataRecord credentialTypes](self, "credentialTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialTypes");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "credentialTypes");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_44;
      v10 = (void *)v9;
      -[HKSignedClinicalDataRecord credentialTypes](self, "credentialTypes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "credentialTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToArray:", v12);

      if (!v13)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord issuerIdentifier](self, "issuerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issuerIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "issuerIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_44;
      v17 = (void *)v16;
      -[HKSignedClinicalDataRecord issuerIdentifier](self, "issuerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "issuerIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord issuedDate](self, "issuedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issuedDate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "issuedDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_44;
      v23 = (void *)v22;
      -[HKSignedClinicalDataRecord issuedDate](self, "issuedDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "issuedDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord relevantDate](self, "relevantDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relevantDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "relevantDate");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_44;
      v29 = (void *)v28;
      -[HKSignedClinicalDataRecord relevantDate](self, "relevantDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relevantDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord expirationDate](self, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "expirationDate");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_44;
      v35 = (void *)v34;
      -[HKSignedClinicalDataRecord expirationDate](self, "expirationDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_45;
    }
    v39 = -[HKSignedClinicalDataRecord signatureStatus](self, "signatureStatus");
    if (v39 != objc_msgSend(v5, "signatureStatus"))
      goto LABEL_45;
    -[HKSignedClinicalDataRecord subject](self, "subject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v40)
    {

    }
    else
    {
      v8 = (void *)v40;
      objc_msgSend(v5, "subject");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_44;
      v42 = (void *)v41;
      -[HKSignedClinicalDataRecord subject](self, "subject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v46)
    {

    }
    else
    {
      v8 = (void *)v46;
      objc_msgSend(v5, "items");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_44;
      v48 = (void *)v47;
      -[HKSignedClinicalDataRecord items](self, "items");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "items");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqualToArray:", v50);

      if (!v51)
        goto LABEL_45;
    }
    -[HKSignedClinicalDataRecord dataValue](self, "dataValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataValue");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v52)
    {

LABEL_49:
      v59 = -[HKSignedClinicalDataRecord sourceType](self, "sourceType");
      v14 = v59 == objc_msgSend(v5, "sourceType");
      goto LABEL_46;
    }
    v8 = (void *)v52;
    objc_msgSend(v5, "dataValue");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = (void *)v53;
      -[HKSignedClinicalDataRecord dataValue](self, "dataValue");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqual:", v56);

      if (v57)
        goto LABEL_49;
LABEL_45:
      v14 = 0;
LABEL_46:

      goto LABEL_47;
    }
LABEL_44:

    goto LABEL_45;
  }
  v14 = 0;
LABEL_47:

  return v14;
}

- (NSArray)credentialTypes
{
  return self->_credentialTypes;
}

- (void)_setCredentialTypes:(id)a3
{
  NSArray *v4;
  NSArray *credentialTypes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  credentialTypes = self->_credentialTypes;
  self->_credentialTypes = v4;

}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)_setIssuerIdentifier:(id)a3
{
  NSString *v4;
  NSString *issuerIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  issuerIdentifier = self->_issuerIdentifier;
  self->_issuerIdentifier = v4;

}

- (NSDate)issuedDate
{
  return self->_issuedDate;
}

- (void)_setIssuedDate:(id)a3
{
  NSDate *v4;
  NSDate *issuedDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  issuedDate = self->_issuedDate;
  self->_issuedDate = v4;

}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)_setRelevantDate:(id)a3
{
  NSDate *v4;
  NSDate *relevantDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  relevantDate = self->_relevantDate;
  self->_relevantDate = v4;

}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)_setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  expirationDate = self->_expirationDate;
  self->_expirationDate = v4;

}

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (void)_setSignatureStatus:(int64_t)a3
{
  self->_signatureStatus = a3;
}

- (HKSignedClinicalDataSubject)subject
{
  return self->_subject;
}

- (void)_setSubject:(id)a3
{
  HKSignedClinicalDataSubject *v4;
  HKSignedClinicalDataSubject *subject;

  v4 = (HKSignedClinicalDataSubject *)objc_msgSend(a3, "copy");
  subject = self->_subject;
  self->_subject = v4;

}

- (NSArray)items
{
  return self->_items;
}

- (void)_setItems:(id)a3
{
  NSArray *v4;
  NSArray *items;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  items = self->_items;
  self->_items = v4;

}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)_setDataValue:(id)a3
{
  NSData *v4;
  NSData *dataValue;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  dataValue = self->_dataValue;
  self->_dataValue = v4;

}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)_setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKSignedClinicalDataRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_17:
    v8 = v7;
    goto LABEL_18;
  }
  if (!self->_credentialTypes)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: credentialTypes must not be nil");
LABEL_16:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!self->_issuerIdentifier)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: issuerIdentifier must not be nil");
    goto LABEL_16;
  }
  if (!self->_issuedDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: issuedDate must not be nil");
    goto LABEL_16;
  }
  if (!self->_relevantDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: relevantDate must not be nil");
    goto LABEL_16;
  }
  if (!self->_subject)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: subject must not be nil");
    goto LABEL_16;
  }
  if (!self->_items)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: items must not be nil");
    goto LABEL_16;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_issuedDate, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialTypes, 0);
}

- (NSString)recordTypeDisplayName
{
  void *v2;
  void *v3;

  -[HKSignedClinicalDataRecord credentialTypes](self, "credentialTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataUtilities recordTypeDisplayNameWithTypes:](HKSignedClinicalDataUtilities, "recordTypeDisplayNameWithTypes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recordItemsDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSignedClinicalDataRecord items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_55);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataUtilities recordItemsDisplayNameWithItems:](HKSignedClinicalDataUtilities, "recordItemsDisplayNameWithItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

id __67__HKSignedClinicalDataRecord_HealthRecords__recordItemsDisplayName__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "primaryConcept");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)recordIssuerDisplayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKSignedClinicalDataRecord issuerIdentifier](self, "issuerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataUtilities preferredRecordIssuerDisplayNameWithIssuerIdentifier:](HKSignedClinicalDataUtilities, "preferredRecordIssuerDisplayNameWithIssuerIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[HKObject sourceRevision](self, "sourceRevision");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      v5 = v8;
    }
    else
    {
      -[HKSignedClinicalDataRecord issuerIdentifier](self, "issuerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKSignedClinicalDataUtilities recordIssuerDisplayNameWithIssuerIdentifier:](HKSignedClinicalDataUtilities, "recordIssuerDisplayNameWithIssuerIdentifier:", v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v5;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  +[HKSignedClinicalDataItem indexableKeyPathsWithPrefix:](HKSignedClinicalDataItem, "indexableKeyPathsWithPrefix:", CFSTR("items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKSignedClinicalDataRecord;
  objc_msgSendSuper2(&v3, sel_cachedConceptRelationshipKeyPaths);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("items")))
    {
      +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v6, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HKSignedClinicalDataRecord items](self, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "codingsForKeyPath:error:", v9, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)HKSignedClinicalDataRecord;
      -[HKMedicalRecord codingsForKeyPath:error:](&v13, sel_codingsForKeyPath_error_, v6, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("items")))
    {
      +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v9, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[HKSignedClinicalDataRecord items](self, "items");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[HKSignedClinicalDataRecord items](self, "items");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "applyConcepts:forKeyPath:error:", v8, v12, a5);

        }
        else
        {
          v15 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
        }
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HKSignedClinicalDataRecord;
      v15 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v17, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)signedClinicalDataRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 credentialTypes:(id)a14 issuerIdentifier:(id)a15 issuedDate:(id)a16 relevantDate:(id)a17 expirationDate:(id)a18 signatureStatus:(int64_t)a19 subject:(id)a20 items:(id)a21 dataValue:(id)a22 sourceType:(int64_t)a23
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v34;
  id v37;
  void *v39;
  _BOOL4 v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;

  v40 = a5;
  v42 = a16;
  v23 = a22;
  v24 = a21;
  v32 = a20;
  v31 = a18;
  v30 = a17;
  v29 = a15;
  v25 = a14;
  v43 = a12;
  v44 = a11;
  v47 = a10;
  v34 = a8;
  v46 = a7;
  v26 = a6;
  v37 = a4;
  v27 = a3;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", CFSTR("issuedDate"), v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataRecord signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:](HKSignedClinicalDataRecord, "signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:", v27, v37, v40, v26, v46, v34, a9, v47, v44, v39, v43, a13, v25, v29, v42,
    v30,
    v31,
    a19,
    v32,
    v24,
    v23,
    a23);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

@end
