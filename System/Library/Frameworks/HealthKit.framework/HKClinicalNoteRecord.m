@implementation HKClinicalNoteRecord

+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 documentTypeCodingCollection:(id)a15 noteCreationDate:(id)a16 categoriesCodingCollections:(id)a17 relevantStartDate:(id)a18 relevantEndDate:(id)a19 authors:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __CFString *v29;
  id v30;
  void *v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  void *v36;
  id v38;
  id v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v40 = a5;
  v49 = a3;
  v48 = a4;
  v24 = a6;
  v43 = a7;
  v42 = a8;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a14;
  v25 = a15;
  v26 = a16;
  v39 = a17;
  v27 = a18;
  v38 = a19;
  v28 = a20;
  v29 = CFSTR("modifiedDate");
  v30 = v24;
  v31 = v30;
  if (!v26)
  {
    v33 = v30;
    if (!v27)
      goto LABEL_4;
    goto LABEL_3;
  }
  v32 = CFSTR("noteCreationDate");

  objc_msgSend(v26, "dateForUTC");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v32;
  if (v27)
  {
LABEL_3:
    v34 = CFSTR("relevantStartDate");

    objc_msgSend(v27, "dateForUTC");
    v35 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v35;
    v29 = v34;
  }
LABEL_4:
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v29, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKClinicalNoteRecord clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:](HKClinicalNoteRecord, "clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:", v49, v48, v40, v31, v43, v42, a9, v47, v46, v36, v45, a13, v44, v25, v26,
    v39,
    v27,
    v38,
    v28);
  v41 = (id)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "codings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultDisplayString
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_CLINICAL_NOTE"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Notes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)recordCategoryType
{
  return 10;
}

+ (id)clinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newClinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           0));
}

+ (id)_newClinicalNoteRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 documentTypeCodingCollection:(id)a16 noteCreationDate:(id)a17 categoriesCodingCollections:(id)a18 relevantStartDate:(id)a19 relevantEndDate:(id)a20 authors:(id)a21 config:(id)a22
{
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
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _BOOL4 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v47 = a5;
  v22 = a15;
  v23 = a16;
  v24 = a17;
  v25 = a18;
  v26 = a19;
  v27 = a20;
  v28 = a21;
  v29 = a22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __305__HKClinicalNoteRecord__newClinicalNoteRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_documentTypeCodingCollection_noteCreationDate_categoriesCodingCollections_relevantStartDate_relevantEndDate_authors_config___block_invoke;
  aBlock[3] = &unk_1E37EED70;
  v59 = v22;
  v60 = v23;
  v61 = v24;
  v62 = v25;
  v63 = v26;
  v64 = v27;
  v65 = v28;
  v66 = v29;
  v56 = v29;
  v55 = v28;
  v54 = v27;
  v53 = v26;
  v52 = v25;
  v51 = v24;
  v50 = v23;
  v49 = v22;
  v30 = a13;
  v31 = a12;
  v32 = a11;
  v33 = a10;
  v34 = a8;
  v35 = a7;
  v36 = a6;
  v37 = a4;
  v38 = a3;
  v39 = _Block_copy(aBlock);
  v57.receiver = a1;
  v57.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
  v48 = objc_msgSendSuper2(&v57, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v38, v37, v47, v36, v35, v34, a9, v33, v32, v31, v30, a14, v39);

  return v48;
}

void __305__HKClinicalNoteRecord__newClinicalNoteRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_documentTypeCodingCollection_noteCreationDate_categoriesCodingCollections_relevantStartDate_relevantEndDate_authors_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v18;

  v18 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v18[22];
  v18[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v18[23];
  v18[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v18[24];
  v18[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v18[25];
  v18[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v18[26];
  v18[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v18[27];
  v18[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v18[28];
  v18[28] = v15;

  v17 = *(_QWORD *)(a1 + 88);
  if (v17)
    (*(void (**)(uint64_t, _QWORD *))(v17 + 16))(v17, v18);

}

- (HKClinicalNoteRecord)init
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
  v9.super_class = (Class)HKClinicalNoteRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@statusCoding = %@documentTypeCodingCollection = %@noteCreationDate = %@categoriesCodingCollections = %@relevantStartDate = %@relevantEndDate = %@authors = %@>"), v5, self, v6, self->_statusCoding, self->_documentTypeCodingCollection, self->_noteCreationDate, self->_categoriesCodingCollections, self->_relevantStartDate, self->_relevantEndDate, self->_authors);
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
  v5.super_class = (Class)HKClinicalNoteRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentTypeCodingCollection, CFSTR("DocumentTypeCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_noteCreationDate, CFSTR("NoteCreationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoriesCodingCollections, CFSTR("CategoriesCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relevantStartDate, CFSTR("RelevantStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relevantEndDate, CFSTR("RelevantEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authors, CFSTR("Authors"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_documentType, CFSTR("DocumentType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categories, CFSTR("Categories"));

}

- (HKClinicalNoteRecord)initWithCoder:(id)a3
{
  id v4;
  HKClinicalNoteRecord *v5;
  uint64_t v6;
  HKMedicalCoding *statusCoding;
  uint64_t v8;
  HKMedicalCodingCollection *documentTypeCodingCollection;
  uint64_t v10;
  HKMedicalDate *noteCreationDate;
  void *v12;
  uint64_t v13;
  NSArray *categoriesCodingCollections;
  uint64_t v15;
  HKMedicalDate *relevantStartDate;
  uint64_t v17;
  HKMedicalDate *relevantEndDate;
  void *v19;
  uint64_t v20;
  NSArray *authors;
  uint64_t v22;
  HKConcept *status;
  uint64_t v24;
  HKConcept *documentType;
  void *v26;
  uint64_t v27;
  NSArray *categories;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKClinicalNoteRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentTypeCodingCollection"));
    v8 = objc_claimAutoreleasedReturnValue();
    documentTypeCodingCollection = v5->_documentTypeCodingCollection;
    v5->_documentTypeCodingCollection = (HKMedicalCodingCollection *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NoteCreationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    noteCreationDate = v5->_noteCreationDate;
    v5->_noteCreationDate = (HKMedicalDate *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("CategoriesCodingCollections"));
    v13 = objc_claimAutoreleasedReturnValue();
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelevantStartDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    relevantStartDate = v5->_relevantStartDate;
    v5->_relevantStartDate = (HKMedicalDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelevantEndDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    relevantEndDate = v5->_relevantEndDate;
    v5->_relevantEndDate = (HKMedicalDate *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("Authors"));
    v20 = objc_claimAutoreleasedReturnValue();
    authors = v5->_authors;
    v5->_authors = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v22 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentType"));
    v24 = objc_claimAutoreleasedReturnValue();
    documentType = v5->_documentType;
    v5->_documentType = (HKConcept *)v24;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("Categories"));
    v27 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v27;

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
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  char v68;
  objc_super v70;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v70.receiver = self;
    v70.super_class = (Class)HKClinicalNoteRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v70, sel_isEquivalent_, v5))
      goto LABEL_54;
    -[HKClinicalNoteRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "statusCoding");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_53;
      v10 = (void *)v9;
      -[HKClinicalNoteRecord statusCoding](self, "statusCoding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentTypeCodingCollection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "documentTypeCodingCollection");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_53;
      v17 = (void *)v16;
      -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentTypeCodingCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord noteCreationDate](self, "noteCreationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteCreationDate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "noteCreationDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_53;
      v23 = (void *)v22;
      -[HKClinicalNoteRecord noteCreationDate](self, "noteCreationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "noteCreationDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoriesCodingCollections");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "categoriesCodingCollections");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_53;
      v29 = (void *)v28;
      -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoriesCodingCollections");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToArray:", v31);

      if (!v32)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord relevantStartDate](self, "relevantStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relevantStartDate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "relevantStartDate");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_53;
      v35 = (void *)v34;
      -[HKClinicalNoteRecord relevantStartDate](self, "relevantStartDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relevantStartDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord relevantEndDate](self, "relevantEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relevantEndDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "relevantEndDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_53;
      v41 = (void *)v40;
      -[HKClinicalNoteRecord relevantEndDate](self, "relevantEndDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relevantEndDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord authors](self, "authors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authors");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "authors");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_53;
      v47 = (void *)v46;
      -[HKClinicalNoteRecord authors](self, "authors");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "authors");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqualToArray:", v49);

      if (!v50)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "status");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_53;
      v53 = (void *)v52;
      -[HKClinicalNoteRecord status](self, "status");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord documentType](self, "documentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentType");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "documentType");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_53;
      v59 = (void *)v58;
      -[HKClinicalNoteRecord documentType](self, "documentType");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentType");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_54;
    }
    -[HKClinicalNoteRecord categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categories");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

LABEL_58:
      v14 = 1;
      goto LABEL_55;
    }
    v8 = (void *)v63;
    objc_msgSend(v5, "categories");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v65 = (void *)v64;
      -[HKClinicalNoteRecord categories](self, "categories");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categories");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqualToArray:", v67);

      if ((v68 & 1) != 0)
        goto LABEL_58;
LABEL_54:
      v14 = 0;
LABEL_55:

      goto LABEL_56;
    }
LABEL_53:

    goto LABEL_54;
  }
  v14 = 0;
LABEL_56:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKClinicalNoteRecord statusCoding](self, "statusCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *statusCoding;
  HKConcept *v6;
  HKConcept *status;
  id v8;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  -[HKClinicalNoteRecord statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (HKMedicalCodingCollection)documentTypeCodingCollection
{
  return self->_documentTypeCodingCollection;
}

- (void)_setDocumentTypeCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *documentTypeCodingCollection;
  HKConcept *v6;
  HKConcept *documentType;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  documentTypeCodingCollection = self->_documentTypeCodingCollection;
  self->_documentTypeCodingCollection = v4;

  -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  documentType = self->_documentType;
  self->_documentType = v6;

}

- (HKMedicalDate)noteCreationDate
{
  return self->_noteCreationDate;
}

- (void)_setNoteCreationDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *noteCreationDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  noteCreationDate = self->_noteCreationDate;
  self->_noteCreationDate = v4;

}

- (NSArray)categoriesCodingCollections
{
  return self->_categoriesCodingCollections;
}

- (void)_setCategoriesCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *categoriesCodingCollections;
  NSArray *v6;
  NSArray *categories;
  id v8;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  categoriesCodingCollections = self->_categoriesCodingCollections;
  self->_categoriesCodingCollections = v4;

  -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_52);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;

}

id __56__HKClinicalNoteRecord__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalDate)relevantStartDate
{
  return self->_relevantStartDate;
}

- (void)_setRelevantStartDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *relevantStartDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  relevantStartDate = self->_relevantStartDate;
  self->_relevantStartDate = v4;

}

- (HKMedicalDate)relevantEndDate
{
  return self->_relevantEndDate;
}

- (void)_setRelevantEndDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *relevantEndDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  relevantEndDate = self->_relevantEndDate;
  self->_relevantEndDate = v4;

}

- (NSArray)authors
{
  return self->_authors;
}

- (void)_setAuthors:(id)a3
{
  NSArray *v4;
  NSArray *authors;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  authors = self->_authors;
  self->_authors = v4;

}

- (HKConcept)status
{
  HKConcept *status;
  HKConcept *v3;
  void *v4;

  status = self->_status;
  if (status)
  {
    v3 = status;
  }
  else
  {
    -[HKClinicalNoteRecord statusCodingCollection](self, "statusCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *status;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKClinicalNoteRecord _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (HKConcept)documentType
{
  HKConcept *documentType;
  HKConcept *v3;
  void *v4;

  documentType = self->_documentType;
  if (documentType)
  {
    v3 = documentType;
  }
  else
  {
    -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setDocumentType:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *documentType;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKClinicalNoteRecord _setDocumentType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  documentType = self->_documentType;
  self->_documentType = v13;

}

- (NSArray)categories
{
  NSArray *categories;
  NSArray *v3;
  void *v4;

  categories = self->_categories;
  if (categories)
  {
    v3 = categories;
  }
  else
  {
    -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_65_0);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __34__HKClinicalNoteRecord_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setCategories:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *categories;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKClinicalNoteRecord _setCategories:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (NSArray *)objc_msgSend(v4, "copy");
  categories = self->_categories;
  self->_categories = v13;

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
  v13.super_class = (Class)HKClinicalNoteRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_11:
    v8 = v7;
    goto LABEL_12;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
LABEL_10:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!self->_documentTypeCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: documentTypeCodingCollection must not be nil");
    goto LABEL_10;
  }
  if (!self->_categoriesCodingCollections)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: categoriesCodingCollections must not be nil");
    goto LABEL_10;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_relevantEndDate, 0);
  objc_storeStrong((id *)&self->_relevantStartDate, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);
  objc_storeStrong((id *)&self->_noteCreationDate, 0);
  objc_storeStrong((id *)&self->_documentTypeCodingCollection, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("documentType"));
  objc_msgSend(v3, "addObject:", CFSTR("categories"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKClinicalNoteRecord;
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
  void *v12;
  objc_super v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("status")))
    {
      -[HKClinicalNoteRecord statusCoding](self, "statusCoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("documentType")))
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("categories")))
        {
          v14.receiver = self;
          v14.super_class = (Class)HKClinicalNoteRecord;
          -[HKMedicalRecord codingsForKeyPath:error:](&v14, sel_codingsForKeyPath_error_, v6, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
        -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v9, v6, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      -[HKClinicalNoteRecord documentTypeCodingCollection](self, "documentTypeCodingCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalNoteRecord _setStatus:](self, "_setStatus:", v13);
LABEL_8:

      v14 = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("documentType")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalNoteRecord _setDocumentType:](self, "_setDocumentType:", v13);
      goto LABEL_8;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("categories")))
  {
    -[HKClinicalNoteRecord categoriesCodingCollections](self, "categoriesCodingCollections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v16, "count"), v9, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v17 != 0;
    if (v17)
      -[HKClinicalNoteRecord _setCategories:](self, "_setCategories:", v17);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HKClinicalNoteRecord;
    v14 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v18, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
  }
LABEL_10:

  return v14;
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKClinicalNoteRecord.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_setDocumentType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property documentType for record type HKClinicalNoteRecord.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_setCategories:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property categories for record type HKClinicalNoteRecord.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
