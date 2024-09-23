@implementation HKVerifiableClinicalRecord

+ (HKVerifiableClinicalRecord)verifiableClinicalRecordWithType:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7 recordTypes:(id)a8 issuedDate:(id)a9 relevantDate:(id)a10 expirationDate:(id)a11 issuerIdentifier:(id)a12 subject:(id)a13 itemNames:(id)a14 dataRepresentation:(id)a15 originIdentifier:(id)a16 sourceType:(int64_t)a17
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
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
  void *v35;
  id v36;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  _QWORD aBlock[4];
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int64_t v62;

  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __230__HKVerifiableClinicalRecord_verifiableClinicalRecordWithType_startDate_endDate_device_metadata_recordTypes_issuedDate_relevantDate_expirationDate_issuerIdentifier_subject_itemNames_dataRepresentation_originIdentifier_sourceType___block_invoke;
  aBlock[3] = &unk_1E37F4A88;
  v52 = v18;
  v53 = v19;
  v54 = v20;
  v55 = v21;
  v56 = v22;
  v57 = v23;
  v58 = v24;
  v59 = v25;
  v60 = v26;
  v61 = a1;
  v27 = a1;
  v62 = a17;
  v43 = v26;
  v49 = v25;
  v48 = v24;
  v47 = v23;
  v46 = v22;
  v45 = v21;
  v44 = v20;
  v28 = v19;
  v29 = v18;
  v30 = a7;
  v31 = a6;
  v32 = a5;
  v33 = a4;
  v34 = a3;
  v35 = _Block_copy(aBlock);
  v50.receiver = v27;
  v50.super_class = (Class)&OBJC_METACLASS___HKVerifiableClinicalRecord;
  v36 = objc_msgSendSuper2(&v50, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v34, v33, v32, v31, v30, v35);

  return (HKVerifiableClinicalRecord *)v36;
}

void __230__HKVerifiableClinicalRecord_verifiableClinicalRecordWithType_startDate_endDate_device_metadata_recordTypes_issuedDate_relevantDate_expirationDate_issuerIdentifier_subject_itemNames_dataRepresentation_originIdentifier_sourceType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)v4[12];
  v4[12] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = (void *)v4[15];
  v4[15] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v10 = (void *)v4[16];
  v4[16] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v12 = (void *)v4[17];
  v4[17] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v18 = (void *)v4[18];
  v4[18] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v20 = (void *)v4[21];
  v4[21] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v22 = (void *)v4[20];
  v4[20] = v21;

  v23 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v24 = (void *)v4[22];
  v4[22] = v23;

  objc_msgSend((id)objc_opt_class(), "sourceTypeForInternalType:", *(_QWORD *)(a1 + 112));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v27, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

}

- (HKVerifiableClinicalRecord)init
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

- (id)description
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
  v9.super_class = (Class)HKVerifiableClinicalRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@, recordTypes = %@, issuedDate = %@, relevantDate = %@, expirationDate = %@, issuerIdentifier = %@, subject = %@, itemNames = %@, dataRepresentation = %@, sourceType = %@, originIdentifier = %@>"), v5, self, v6, self->_recordTypes, self->_issuedDate, self->_relevantDate, self->_expirationDate, self->_issuerIdentifier, self->_subject, self->_itemNames, self->_dataRepresentation, self->_sourceType, self->_originIdentifier, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v5.super_class = (Class)HKVerifiableClinicalRecord;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordTypes, CFSTR("RecordTypes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuedDate, CFSTR("IssuedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relevantDate, CFSTR("RelevantDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerIdentifier, CFSTR("IssuerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("Subject"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemNames, CFSTR("ItemNames"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataRepresentation, CFSTR("DataRepresentation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceType, CFSTR("SourceType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originIdentifier, CFSTR("OriginIdentifier"));

}

- (HKVerifiableClinicalRecord)initWithCoder:(id)a3
{
  id v4;
  HKVerifiableClinicalRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *recordTypes;
  uint64_t v11;
  NSDate *issuedDate;
  uint64_t v13;
  NSDate *relevantDate;
  uint64_t v15;
  NSDate *expirationDate;
  uint64_t v17;
  NSString *issuerIdentifier;
  uint64_t v19;
  HKVerifiableClinicalRecordSubject *subject;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *itemNames;
  uint64_t v26;
  NSData *dataRepresentation;
  NSData *v28;
  uint64_t v29;
  NSData *v30;
  uint64_t v31;
  NSData *JWSRepresentation;
  uint64_t v33;
  NSString *sourceType;
  uint64_t v35;
  NSUUID *originIdentifier;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HKVerifiableClinicalRecord;
  v5 = -[HKSample initWithCoder:](&v38, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("RecordTypes"));
    v9 = objc_claimAutoreleasedReturnValue();
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v9;

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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssuerIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    issuerIdentifier = v5->_issuerIdentifier;
    v5->_issuerIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subject"));
    v19 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (HKVerifiableClinicalRecordSubject *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("ItemNames"));
    v24 = objc_claimAutoreleasedReturnValue();
    itemNames = v5->_itemNames;
    v5->_itemNames = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DataRepresentation"));
    v26 = objc_claimAutoreleasedReturnValue();
    dataRepresentation = v5->_dataRepresentation;
    v5->_dataRepresentation = (NSData *)v26;

    v28 = v5->_dataRepresentation;
    if (!v28)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JWSRepresentation"));
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v5->_dataRepresentation;
      v5->_dataRepresentation = (NSData *)v29;

      v28 = v5->_dataRepresentation;
    }
    v31 = -[NSData copy](v28, "copy");
    JWSRepresentation = v5->_JWSRepresentation;
    v5->_JWSRepresentation = (NSData *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceType"));
    v33 = objc_claimAutoreleasedReturnValue();
    sourceType = v5->_sourceType;
    v5->_sourceType = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OriginIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (NSUUID *)v35;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  void *v3;
  HKVerifiableClinicalRecord *v5;
  HKVerifiableClinicalRecord *v6;
  NSArray *recordTypes;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  char v12;
  NSDate *issuedDate;
  NSDate *v14;
  uint64_t v15;
  void *v16;
  NSDate *v17;
  NSDate *relevantDate;
  _BOOL4 v19;
  uint64_t v20;
  NSDate *v21;
  NSDate *v22;
  NSDate *v23;
  NSArray *v24;
  NSDate *expirationDate;
  BOOL v26;
  _BOOL4 v27;
  uint64_t v28;
  NSDate *v29;
  _BOOL4 v30;
  void *v31;
  NSString *issuerIdentifier;
  uint64_t v33;
  NSString *v34;
  NSDate *v35;
  NSString *v36;
  _BOOL4 v37;
  HKVerifiableClinicalRecordSubject *subject;
  uint64_t v39;
  HKVerifiableClinicalRecordSubject *v40;
  HKVerifiableClinicalRecordSubject *v41;
  _BOOL4 v42;
  NSArray *itemNames;
  _BOOL4 v44;
  uint64_t v45;
  NSArray *v46;
  _BOOL4 v47;
  NSData *dataRepresentation;
  uint64_t v49;
  NSData *v50;
  NSData *v51;
  uint64_t v52;
  NSData *v53;
  _BOOL4 v54;
  NSString *sourceType;
  uint64_t v56;
  NSString *v57;
  uint64_t v58;
  NSString *v59;
  void *v60;
  _BOOL4 v61;
  NSUUID *originIdentifier;
  uint64_t v63;
  NSUUID *v64;
  uint64_t v65;
  NSUUID *v66;
  void *v67;
  void *v68;
  NSData *v69;
  NSData *v70;
  void *v72;
  NSUUID *v73;
  void *v74;
  NSString *v75;
  void *v76;
  void *v77;
  NSData *v78;
  _BOOL4 v79;
  NSString *v80;
  NSData *v81;
  void *v82;
  void *v83;
  HKVerifiableClinicalRecordSubject *v84;
  NSArray *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  NSArray *v89;
  void *v90;
  void *v91;
  HKVerifiableClinicalRecordSubject *v92;
  _BOOL4 v93;
  _BOOL4 v94;
  NSString *v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  NSDate *v99;
  NSString *v100;
  void *v101;
  NSDate *v102;
  void *v103;
  void *v104;
  NSDate *v105;
  NSDate *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  NSDate *v110;
  NSArray *v111;
  objc_super v112;

  v5 = (HKVerifiableClinicalRecord *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    v112.receiver = self;
    v112.super_class = (Class)HKVerifiableClinicalRecord;
    if (-[HKSample isEquivalent:](&v112, sel_isEquivalent_, v5))
    {
      v6 = v5;
      recordTypes = self->_recordTypes;
      -[HKVerifiableClinicalRecord recordTypes](v6, "recordTypes");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (recordTypes != v8)
      {
        -[HKVerifiableClinicalRecord recordTypes](v6, "recordTypes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v12 = 0;
LABEL_114:

          goto LABEL_115;
        }
        v10 = self->_recordTypes;
        -[HKVerifiableClinicalRecord recordTypes](v6, "recordTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray isEqualToArray:](v10, "isEqualToArray:", v11))
        {
          v12 = 0;
LABEL_72:

          goto LABEL_114;
        }
        v3 = v9;
        v109 = v11;
      }
      v111 = recordTypes;
      issuedDate = self->_issuedDate;
      -[HKVerifiableClinicalRecord issuedDate](v6, "issuedDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v108 = issuedDate != v14;
      if (issuedDate != v14)
      {
        -[HKVerifiableClinicalRecord issuedDate](v6, "issuedDate");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
        {

          v12 = 0;
          v24 = v111;
          v11 = v109;
          v9 = v3;
          if (v111 == v8)
          {
LABEL_113:
            if (v24 != v8)
              goto LABEL_114;
            goto LABEL_115;
          }
LABEL_112:

          goto LABEL_113;
        }
        v16 = (void *)v15;
        v17 = self->_issuedDate;
        -[HKVerifiableClinicalRecord issuedDate](v6, "issuedDate");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqual:](v17, "isEqual:"))
        {
          v12 = 0;
          v11 = v109;
          v23 = v14;
          v9 = v3;
          goto LABEL_71;
        }
        v104 = v16;
      }
      relevantDate = self->_relevantDate;
      -[HKVerifiableClinicalRecord relevantDate](v6, "relevantDate");
      v110 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v106 = relevantDate;
      v19 = relevantDate != v110;
      if (relevantDate != v110)
      {
        -[HKVerifiableClinicalRecord relevantDate](v6, "relevantDate");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {

          v12 = 0;
          v26 = issuedDate == v14;
          v23 = v14;
          if (!v26)
          {
            LOBYTE(v30) = 1;
            v11 = v109;
            v31 = v104;
            v9 = v3;
            goto LABEL_109;
          }
          v30 = 0;
          v11 = v109;
          v31 = v104;
          v9 = v3;
LABEL_117:
          if (!v30)
            goto LABEL_111;
LABEL_110:

          goto LABEL_111;
        }
        v101 = (void *)v20;
        v21 = self->_relevantDate;
        -[HKVerifiableClinicalRecord relevantDate](v6, "relevantDate");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqual:](v21, "isEqual:"))
        {
          v12 = 0;
          v22 = issuedDate;
          v23 = v14;
          v9 = v3;
          goto LABEL_70;
        }
      }
      expirationDate = self->_expirationDate;
      -[HKVerifiableClinicalRecord expirationDate](v6, "expirationDate");
      v105 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v102 = expirationDate;
      v26 = expirationDate == v105;
      v27 = expirationDate != v105;
      if (v26)
      {
        v94 = v27;
      }
      else
      {
        -[HKVerifiableClinicalRecord expirationDate](v6, "expirationDate");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
        {

          v12 = 0;
          v22 = issuedDate;
          if (v106 != v110)
          {
            LOBYTE(v37) = 1;
            v30 = issuedDate != v14;
            v23 = v14;
            v9 = v3;
            goto LABEL_106;
          }
          v37 = 0;
          v30 = issuedDate != v14;
          v23 = v14;
          v9 = v3;
LABEL_119:
          if (!v37)
            goto LABEL_108;
LABEL_107:

          goto LABEL_108;
        }
        v96 = (void *)v28;
        v29 = self->_expirationDate;
        -[HKVerifiableClinicalRecord expirationDate](v6, "expirationDate");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSDate isEqual:](v29, "isEqual:"))
        {
          v12 = 0;
          v35 = v106;
          v22 = issuedDate;
          v23 = v14;
          v9 = v3;
          goto LABEL_69;
        }
        v94 = v27;
      }
      issuerIdentifier = self->_issuerIdentifier;
      -[HKVerifiableClinicalRecord issuerIdentifier](v6, "issuerIdentifier");
      v100 = (NSString *)objc_claimAutoreleasedReturnValue();
      v95 = issuerIdentifier;
      v93 = issuerIdentifier != v100;
      v99 = issuedDate;
      v98 = v19;
      if (issuerIdentifier == v100)
      {
        v23 = v14;
      }
      else
      {
        -[HKVerifiableClinicalRecord issuerIdentifier](v6, "issuerIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        if (!v33)
        {

          v12 = 0;
          v35 = v106;
          v23 = v14;
          if (v102 != v105)
          {
            LOBYTE(v42) = 1;
            v9 = v3;
            v22 = v99;
            goto LABEL_103;
          }
          v42 = 0;
          v9 = v3;
          v22 = v99;
LABEL_121:
          if (!v42)
            goto LABEL_105;
LABEL_104:

          goto LABEL_105;
        }
        v90 = (void *)v33;
        v34 = self->_issuerIdentifier;
        -[HKVerifiableClinicalRecord issuerIdentifier](v6, "issuerIdentifier");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v14;
        if (!-[NSString isEqualToString:](v34, "isEqualToString:"))
        {
          v12 = 0;
          v35 = v106;
          v9 = v3;
          v36 = v100;
          v22 = v99;
          goto LABEL_68;
        }
      }
      subject = self->_subject;
      -[HKVerifiableClinicalRecord subject](v6, "subject");
      v92 = (HKVerifiableClinicalRecordSubject *)objc_claimAutoreleasedReturnValue();
      v88 = subject != v92;
      if (subject == v92)
      {
        v9 = v3;
      }
      else
      {
        -[HKVerifiableClinicalRecord subject](v6, "subject");
        v39 = objc_claimAutoreleasedReturnValue();
        v9 = v3;
        if (!v39)
        {

          v12 = 0;
          v36 = v100;
          v35 = v106;
          if (issuerIdentifier != v100)
          {
            LOBYTE(v47) = 1;
            v22 = v99;
            goto LABEL_100;
          }
          v47 = 0;
          v22 = v99;
LABEL_123:
          if (!v47)
            goto LABEL_102;
LABEL_101:

          goto LABEL_102;
        }
        v86 = (void *)v39;
        v40 = self->_subject;
        -[HKVerifiableClinicalRecord subject](v6, "subject");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HKVerifiableClinicalRecordSubject isEqual:](v40, "isEqual:"))
        {
          v12 = 0;
          v35 = v106;
          v22 = v99;
          v41 = v92;
          goto LABEL_67;
        }
      }
      itemNames = self->_itemNames;
      -[HKVerifiableClinicalRecord itemNames](v6, "itemNames");
      v89 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v85 = itemNames;
      v26 = itemNames == v89;
      v44 = itemNames != v89;
      if (v26)
      {
        v79 = v44;
      }
      else
      {
        -[HKVerifiableClinicalRecord itemNames](v6, "itemNames");
        v45 = objc_claimAutoreleasedReturnValue();
        if (!v45)
        {

          v12 = 0;
          v41 = v92;
          v26 = subject == v92;
          v35 = v106;
          v22 = v99;
          if (!v26)
          {
            LOBYTE(v54) = 1;
            goto LABEL_97;
          }
          v54 = 0;
          goto LABEL_125;
        }
        v82 = (void *)v45;
        v46 = self->_itemNames;
        -[HKVerifiableClinicalRecord itemNames](v6, "itemNames");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray isEqualToArray:](v46, "isEqualToArray:"))
        {
          v84 = subject;
          v12 = 0;
          v35 = v106;
          v22 = v99;
          v41 = v92;
          goto LABEL_66;
        }
        v79 = v44;
      }
      dataRepresentation = self->_dataRepresentation;
      -[HKVerifiableClinicalRecord dataRepresentation](v6, "dataRepresentation");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = dataRepresentation;
      v51 = (NSData *)v49;
      v84 = subject;
      v81 = v50;
      if (v50 == (NSData *)v49)
      {
        v78 = (NSData *)v49;
      }
      else
      {
        -[HKVerifiableClinicalRecord dataRepresentation](v6, "dataRepresentation");
        v52 = objc_claimAutoreleasedReturnValue();
        if (!v52)
        {

          v12 = 0;
          v35 = v106;
          v22 = v99;
          v41 = v92;
          v61 = v79;
          if (v85 != v89)
            goto LABEL_91;
          goto LABEL_94;
        }
        v77 = (void *)v52;
        v53 = self->_dataRepresentation;
        -[HKVerifiableClinicalRecord dataRepresentation](v6, "dataRepresentation");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSData isEqual:](v53, "isEqual:"))
        {
          v12 = 0;
          v35 = v106;
          v22 = v99;
          v41 = v92;
LABEL_89:

          if (v85 != v89)
          {
            LOBYTE(v61) = 1;
LABEL_91:

            if (!v61)
              goto LABEL_96;
LABEL_95:

            goto LABEL_96;
          }
          v61 = 0;
LABEL_94:
          if (!v61)
            goto LABEL_96;
          goto LABEL_95;
        }
        v78 = v51;
      }
      sourceType = self->_sourceType;
      -[HKVerifiableClinicalRecord sourceType](v6, "sourceType");
      v80 = (NSString *)objc_claimAutoreleasedReturnValue();
      v75 = sourceType;
      if (sourceType == v80)
      {
        v51 = v78;
      }
      else
      {
        -[HKVerifiableClinicalRecord sourceType](v6, "sourceType");
        v56 = objc_claimAutoreleasedReturnValue();
        v51 = v78;
        if (!v56)
        {
          v12 = 0;
          goto LABEL_88;
        }
        v74 = (void *)v56;
        v57 = self->_sourceType;
        -[HKVerifiableClinicalRecord sourceType](v6, "sourceType");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = v57;
        v60 = (void *)v58;
        if (!-[NSString isEqualToString:](v59, "isEqualToString:", v58))
        {
          v69 = v78;

          v12 = 0;
          goto LABEL_132;
        }
        v72 = v60;
      }
      originIdentifier = self->_originIdentifier;
      -[HKVerifiableClinicalRecord originIdentifier](v6, "originIdentifier");
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = originIdentifier;
      v12 = originIdentifier == (NSUUID *)v63;
      if (!v12)
      {
        v73 = (NSUUID *)v63;
        -[HKVerifiableClinicalRecord originIdentifier](v6, "originIdentifier");
        v65 = objc_claimAutoreleasedReturnValue();
        if (v65)
        {
          v66 = self->_originIdentifier;
          v67 = (void *)v65;
          -[HKVerifiableClinicalRecord originIdentifier](v6, "originIdentifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSUUID isEqual:](v66, "isEqual:", v68);

          if (v75 == v80)
          {

          }
          else
          {

          }
          v69 = v51;
LABEL_132:
          if (v81 != v51)
          {

          }
          if (v85 != v89)
          {

          }
          if (v84 != v92)
          {

          }
          if (v95 != v100)
          {

          }
          if (v102 != v105)
          {

          }
          if (v106 != v110)
          {

          }
          if (v99 != v23)
          {

          }
          v11 = v109;
          if (v111 == v8)
            goto LABEL_115;
          goto LABEL_72;
        }
        v64 = v73;
      }

      if (v75 == v80)
      {

        v70 = v81;
        v35 = v106;
        v22 = v99;
        v41 = v92;
        if (v81 != v51)
          goto LABEL_89;
LABEL_128:

        if (v85 == v89)
        {
LABEL_96:

          v54 = v88;
          if (v84 != v41)
          {
LABEL_97:

            if (!v54)
              goto LABEL_99;
            goto LABEL_98;
          }
LABEL_125:
          if (v54)
LABEL_98:

LABEL_99:
          v36 = v100;
          v47 = v93;
          if (v95 != v100)
          {
LABEL_100:

            if (!v47)
              goto LABEL_102;
            goto LABEL_101;
          }
          goto LABEL_123;
        }
LABEL_66:

        if (v84 != v41)
        {
LABEL_67:

          v36 = v100;
          if (v95 != v100)
          {
LABEL_68:

            if (v102 != v105)
            {
LABEL_69:

              v30 = v108;
              if (v35 != v110)
              {
LABEL_70:

                v26 = v22 == v23;
                v11 = v109;
                v16 = v104;
                if (!v26)
                {
LABEL_71:

                  if (v111 != v8)
                    goto LABEL_72;
LABEL_115:

                  goto LABEL_116;
                }
LABEL_111:

                v24 = v111;
                if (v111 == v8)
                  goto LABEL_113;
                goto LABEL_112;
              }
LABEL_108:

              v26 = v22 == v23;
              v11 = v109;
              v31 = v104;
              if (!v26)
              {
LABEL_109:

                if (!v30)
                  goto LABEL_111;
                goto LABEL_110;
              }
              goto LABEL_117;
            }
LABEL_105:

            v26 = v35 == v110;
            v30 = v108;
            v37 = v98;
            if (!v26)
            {
LABEL_106:

              if (!v37)
                goto LABEL_108;
              goto LABEL_107;
            }
            goto LABEL_119;
          }
LABEL_102:

          v42 = v94;
          if (v102 != v105)
          {
LABEL_103:

            if (!v42)
              goto LABEL_105;
            goto LABEL_104;
          }
          goto LABEL_121;
        }
        goto LABEL_99;
      }

LABEL_88:
      v35 = v106;
      v22 = v99;
      v41 = v92;

      v70 = v81;
      if (v81 != v51)
        goto LABEL_89;
      goto LABEL_128;
    }
    v12 = 0;
  }
LABEL_116:

  return v12;
}

- (void)_setIssuedDate:(id)a3
{
  NSDate *v4;
  NSDate *issuedDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  issuedDate = self->_issuedDate;
  self->_issuedDate = v4;

}

- (void)_setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  expirationDate = self->_expirationDate;
  self->_expirationDate = v4;

}

- (void)_setIssuerIdentifier:(id)a3
{
  NSString *v4;
  NSString *issuerIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  issuerIdentifier = self->_issuerIdentifier;
  self->_issuerIdentifier = v4;

}

- (void)_setItemNames:(id)a3
{
  NSArray *v4;
  NSArray *itemNames;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  itemNames = self->_itemNames;
  self->_itemNames = v4;

}

- (void)_setDataRepresentation:(id)a3
{
  id v4;
  NSData *v5;
  NSData *dataRepresentation;
  NSData *v7;
  NSData *JWSRepresentation;

  v4 = a3;
  v5 = (NSData *)objc_msgSend(v4, "copy");
  dataRepresentation = self->_dataRepresentation;
  self->_dataRepresentation = v5;

  v7 = (NSData *)objc_msgSend(v4, "copy");
  JWSRepresentation = self->_JWSRepresentation;
  self->_JWSRepresentation = v7;

}

- (void)_setOriginIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *originIdentifier;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  originIdentifier = self->_originIdentifier;
  self->_originIdentifier = v4;

}

- (void)_setRecordTypes:(id)a3
{
  NSArray *v4;
  NSArray *recordTypes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  recordTypes = self->_recordTypes;
  self->_recordTypes = v4;

}

- (void)_setRelevantDate:(id)a3
{
  NSDate *v4;
  NSDate *relevantDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  relevantDate = self->_relevantDate;
  self->_relevantDate = v4;

}

- (void)_setSourceType:(int64_t)a3
{
  NSString *v4;
  NSString *sourceType;
  id v6;

  objc_msgSend((id)objc_opt_class(), "sourceTypeForInternalType:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  sourceType = self->_sourceType;
  self->_sourceType = v4;

}

- (void)_setSubject:(id)a3
{
  HKVerifiableClinicalRecordSubject *v4;
  HKVerifiableClinicalRecordSubject *subject;

  v4 = (HKVerifiableClinicalRecordSubject *)objc_msgSend(a3, "copy");
  subject = self->_subject;
  self->_subject = v4;

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
  v13.super_class = (Class)HKVerifiableClinicalRecord;
  -[HKSample _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_21:
    v8 = v7;
    goto LABEL_22;
  }
  if (!-[NSArray count](self->_recordTypes, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: recordTypes must not be empty");
LABEL_20:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!self->_issuedDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: issuedDate must not be nil");
    goto LABEL_20;
  }
  if (!self->_relevantDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: relevantDate must not be nil");
    goto LABEL_20;
  }
  if (!self->_issuerIdentifier)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: issuerIdentifier must not be nil");
    goto LABEL_20;
  }
  if (!self->_subject)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: subject must not be nil");
    goto LABEL_20;
  }
  if (!-[NSArray count](self->_itemNames, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: itemNames must not be empty");
    goto LABEL_20;
  }
  if (!self->_dataRepresentation)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: dataRepresentation must not be nil");
    goto LABEL_20;
  }
  if (!self->_originIdentifier)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: originIdentifier must not be nil");
    goto LABEL_20;
  }
  v8 = 0;
LABEL_22:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (int64_t)_privateSourceTypeForExternalType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMARTHealthCard")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EUDigitalCOVIDCertificate")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)sourceTypeForInternalType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("EUDigitalCOVIDCertificate");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("SMARTHealthCard");
  else
    return (id)v3;
}

- (NSArray)recordTypes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)issuerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (HKVerifiableClinicalRecordSubject)subject
{
  return (HKVerifiableClinicalRecordSubject *)objc_getProperty(self, a2, 112, 1);
}

- (NSDate)issuedDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (NSDate)relevantDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)itemNames
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (HKVerifiableClinicalRecordSourceType)sourceType
{
  return (HKVerifiableClinicalRecordSourceType)objc_getProperty(self, a2, 152, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (NSData)JWSRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (NSUUID)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_JWSRepresentation, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);
  objc_storeStrong((id *)&self->_itemNames, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_issuedDate, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
}

- (NSString)recordTypeDisplayName
{
  void *v2;
  void *v3;

  -[HKVerifiableClinicalRecord recordTypes](self, "recordTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataUtilities recordTypeDisplayNameWithTypes:](HKSignedClinicalDataUtilities, "recordTypeDisplayNameWithTypes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)recordItemsDisplayName
{
  void *v2;
  void *v3;

  -[HKVerifiableClinicalRecord itemNames](self, "itemNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSignedClinicalDataUtilities recordItemsDisplayNameWithItems:](HKSignedClinicalDataUtilities, "recordItemsDisplayNameWithItems:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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

  -[HKVerifiableClinicalRecord issuerIdentifier](self, "issuerIdentifier");
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
      -[HKVerifiableClinicalRecord issuerIdentifier](self, "issuerIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKSignedClinicalDataUtilities recordIssuerDisplayNameWithIssuerIdentifier:](HKSignedClinicalDataUtilities, "recordIssuerDisplayNameWithIssuerIdentifier:", v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v5;
}

@end
