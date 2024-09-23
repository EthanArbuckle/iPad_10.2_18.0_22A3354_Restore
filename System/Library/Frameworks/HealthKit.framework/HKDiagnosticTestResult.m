@implementation HKDiagnosticTestResult

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_DIAGNOSTIC_TEST_RESULT"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)recordCategoryType
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  int64_t v5;

  -[HKDiagnosticTestResult category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticTestResultCategoryFromNSString(v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v4 = 3;
  if (v3 != CFSTR("vital-signs"))
    v4 = 0;
  if (v3 == CFSTR("laboratory"))
    v5 = 2;
  else
    v5 = v4;

  return v5;
}

+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 value:(id)a15 referenceRanges:(id)a16 effectiveStartDate:(id)a17 category:(id)a18 categoriesCodingCollections:(id)a19 issueDate:(id)a20 effectiveEndDate:(id)a21 statusCoding:(id)a22 interpretationCodingCollections:(id)a23 comments:(id)a24 bodySiteCodingCollection:(id)a25 methodCodingCollection:(id)a26 performers:(id)a27 referenceRangeStatus:(int64_t)a28
{
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __CFString *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  void *v44;
  __CFString *v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _BOOL4 v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;

  v59 = a5;
  v70 = a3;
  v69 = a4;
  v32 = a6;
  v68 = a7;
  v67 = a8;
  v66 = a10;
  v65 = a11;
  v64 = a12;
  v63 = a14;
  v62 = a15;
  v58 = a16;
  v33 = a17;
  v57 = a18;
  v61 = a19;
  v34 = a20;
  v35 = a21;
  v56 = a22;
  v55 = a23;
  v36 = a24;
  v54 = a25;
  v37 = a26;
  v53 = a27;
  v38 = CFSTR("modifiedDate");
  v39 = v32;
  v40 = v34;
  v41 = v39;
  v42 = v35;
  if (v40)
  {
    v43 = CFSTR("issueDate");

    objc_msgSend(v40, "dateForUTC");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v43;
    v35 = v42;
    if (!v42)
      goto LABEL_4;
    goto LABEL_3;
  }
  v44 = v39;
  if (v35)
  {
LABEL_3:
    v45 = CFSTR("effectiveEndDate");

    objc_msgSend(v35, "dateForUTC");
    v46 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v46;
    v38 = v45;
  }
LABEL_4:
  if (v33)
  {
    v47 = CFSTR("effectiveStartDate");

    objc_msgSend(v33, "dateForUTC");
    v48 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v48;
    v38 = v47;
  }
  v49 = v33;
  v52 = v33;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v38, v44);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDiagnosticTestResult diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:](HKDiagnosticTestResult, "diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:", v70, v69, v59, v41, v68, v67, a9, v66, v65, v50, v64, a13, v63, v62,
    v58,
    v49,
    v57,
    v61,
    v40,
    v42,
    v56,
    v55,
    v36,
    v54,
    v37,
    v53,
    a28);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

+ (id)diagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newDiagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
                                           a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           a25,
                                           a26,
                                           a27,
                                           a28,
                                           a29,
                                           0));
}

+ (id)_newDiagnosticTestResultWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 value:(id)a16 referenceRanges:(id)a17 effectiveStartDate:(id)a18 category:(id)a19 categoriesCodingCollections:(id)a20 issueDate:(id)a21 effectiveEndDate:(id)a22 statusCoding:(id)a23 interpretationCodingCollections:(id)a24 comments:(id)a25 bodySiteCodingCollection:(id)a26 methodCodingCollection:(id)a27 performers:(id)a28 referenceRangeStatus:(int64_t)a29 config:(id)a30
{
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
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _BOOL4 v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  objc_super v79;
  _QWORD aBlock[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  int64_t v96;

  v69 = a5;
  v77 = a15;
  v75 = a16;
  v73 = a17;
  v71 = a18;
  v30 = a19;
  v31 = a20;
  v32 = a21;
  v33 = a22;
  v34 = a23;
  v35 = a24;
  v36 = a25;
  v37 = a26;
  v38 = a27;
  v39 = a28;
  v40 = a30;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __450__HKDiagnosticTestResult__newDiagnosticTestResultWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_value_referenceRanges_effectiveStartDate_category_categoriesCodingCollections_issueDate_effectiveEndDate_statusCoding_interpretationCodingCollections_comments_bodySiteCodingCollection_methodCodingCollection_performers_referenceRangeStatus_config___block_invoke;
  aBlock[3] = &unk_1E37F0A90;
  v81 = v77;
  v82 = v75;
  v83 = v73;
  v84 = v71;
  v85 = v30;
  v86 = v31;
  v87 = v32;
  v88 = v33;
  v89 = v34;
  v90 = v35;
  v91 = v36;
  v92 = v37;
  v93 = v38;
  v94 = v39;
  v95 = v40;
  v96 = a29;
  v68 = v40;
  v67 = v39;
  v66 = v38;
  v65 = v37;
  v64 = v36;
  v63 = v35;
  v62 = v34;
  v61 = v33;
  v60 = v32;
  v59 = v31;
  v58 = v30;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v41 = a13;
  v42 = a12;
  v43 = a11;
  v44 = a10;
  v45 = a8;
  v46 = a7;
  v47 = a6;
  v48 = a4;
  v49 = a3;
  v50 = _Block_copy(aBlock);
  v79.receiver = a1;
  v79.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
  v70 = objc_msgSendSuper2(&v79, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v49, v48, v69, v47, v46, v45, a9, v44, v43, v42, v41, a14, v50);

  return v70;
}

void __450__HKDiagnosticTestResult__newDiagnosticTestResultWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_value_referenceRanges_effectiveStartDate_category_categoriesCodingCollections_issueDate_effectiveEndDate_statusCoding_interpretationCodingCollections_comments_bodySiteCodingCollection_methodCodingCollection_performers_referenceRangeStatus_config___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;

  v33 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v33[22];
  v33[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v33[23];
  v33[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v33[24];
  v33[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v33[25];
  v33[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v33[26];
  v33[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v33[27];
  v33[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v33[28];
  v33[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v33[29];
  v33[29] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v33[30];
  v33[30] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v33[31];
  v33[31] = v21;

  v23 = objc_msgSend(*(id *)(a1 + 112), "copy");
  v24 = (void *)v33[32];
  v33[32] = v23;

  v25 = objc_msgSend(*(id *)(a1 + 120), "copy");
  v26 = (void *)v33[33];
  v33[33] = v25;

  v27 = objc_msgSend(*(id *)(a1 + 128), "copy");
  v28 = (void *)v33[34];
  v33[34] = v27;

  v29 = objc_msgSend(*(id *)(a1 + 136), "copy");
  v30 = (void *)v33[35];
  v33[35] = v29;

  v31 = v33;
  v33[36] = *(_QWORD *)(a1 + 152);
  v32 = *(_QWORD *)(a1 + 144);
  if (v32)
  {
    (*(void (**)(uint64_t, _QWORD *))(v32 + 16))(v32, v33);
    v31 = v33;
  }

}

- (HKDiagnosticTestResult)init
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
  v9.super_class = (Class)HKDiagnosticTestResult;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@diagnosticTestCodingCollection = %@value = %@referenceRanges = %@effectiveStartDate = %@category = %@categoriesCodingCollections = %@issueDate = %@effectiveEndDate = %@statusCoding = %@interpretationCodingCollections = %@comments = %@bodySiteCodingCollection = %@methodCodingCollection = %@performers = %@referenceRangeStatus = %ld>"), v5, self, v6, self->_diagnosticTestCodingCollection, self->_value, self->_referenceRanges, self->_effectiveStartDate, self->_category, self->_categoriesCodingCollections, self->_issueDate, self->_effectiveEndDate, self->_statusCoding, self->_interpretationCodingCollections, self->_comments, self->_bodySiteCodingCollection, self->_methodCodingCollection,
    self->_performers,
    self->_referenceRangeStatus);
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
  v5.super_class = (Class)HKDiagnosticTestResult;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTestCodingCollection, CFSTR("DiagnosticTestCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("Value"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceRanges, CFSTR("ReferenceRanges"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveStartDate, CFSTR("EffectiveStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, CFSTR("Category"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoriesCodingCollections, CFSTR("CategoriesCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issueDate, CFSTR("IssueDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveEndDate, CFSTR("EffectiveEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_interpretationCodingCollections, CFSTR("InterpretationCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_comments, CFSTR("Comments"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySiteCodingCollection, CFSTR("BodySiteCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_methodCodingCollection, CFSTR("MethodCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_performers, CFSTR("Performers"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_referenceRangeStatus, CFSTR("ReferenceRangeStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTest, CFSTR("DiagnosticTest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categories, CFSTR("Categories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_interpretation, CFSTR("Interpretation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySite, CFSTR("BodySite"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_method, CFSTR("Method"));

}

- (HKDiagnosticTestResult)initWithCoder:(id)a3
{
  id v4;
  HKDiagnosticTestResult *v5;
  uint64_t v6;
  HKMedicalCodingCollection *diagnosticTestCodingCollection;
  uint64_t v8;
  HKInspectableValueCollection *value;
  void *v10;
  uint64_t v11;
  NSArray *referenceRanges;
  uint64_t v13;
  HKMedicalDate *effectiveStartDate;
  uint64_t v15;
  NSString *category;
  void *v17;
  uint64_t v18;
  NSArray *categoriesCodingCollections;
  uint64_t v20;
  HKMedicalDate *issueDate;
  uint64_t v22;
  HKMedicalDate *effectiveEndDate;
  uint64_t v24;
  HKMedicalCoding *statusCoding;
  void *v26;
  uint64_t v27;
  NSArray *interpretationCodingCollections;
  uint64_t v29;
  NSString *comments;
  uint64_t v31;
  HKMedicalCodingCollection *bodySiteCodingCollection;
  uint64_t v33;
  HKMedicalCodingCollection *methodCodingCollection;
  void *v35;
  uint64_t v36;
  NSArray *performers;
  uint64_t v38;
  HKConcept *diagnosticTest;
  void *v40;
  uint64_t v41;
  NSArray *categories;
  uint64_t v43;
  HKConcept *status;
  void *v45;
  uint64_t v46;
  NSArray *interpretation;
  uint64_t v48;
  HKConcept *bodySite;
  uint64_t v50;
  HKConcept *method;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)HKDiagnosticTestResult;
  v5 = -[HKMedicalRecord initWithCoder:](&v53, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DiagnosticTestCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    diagnosticTestCodingCollection = v5->_diagnosticTestCodingCollection;
    v5->_diagnosticTestCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (HKInspectableValueCollection *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("ReferenceRanges"));
    v11 = objc_claimAutoreleasedReturnValue();
    referenceRanges = v5->_referenceRanges;
    v5->_referenceRanges = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveStartDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Category"));
    v15 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("CategoriesCodingCollections"));
    v18 = objc_claimAutoreleasedReturnValue();
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssueDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    issueDate = v5->_issueDate;
    v5->_issueDate = (HKMedicalDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveEndDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v24 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v24;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("InterpretationCodingCollections"));
    v27 = objc_claimAutoreleasedReturnValue();
    interpretationCodingCollections = v5->_interpretationCodingCollections;
    v5->_interpretationCodingCollections = (NSArray *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Comments"));
    v29 = objc_claimAutoreleasedReturnValue();
    comments = v5->_comments;
    v5->_comments = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BodySiteCodingCollection"));
    v31 = objc_claimAutoreleasedReturnValue();
    bodySiteCodingCollection = v5->_bodySiteCodingCollection;
    v5->_bodySiteCodingCollection = (HKMedicalCodingCollection *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MethodCodingCollection"));
    v33 = objc_claimAutoreleasedReturnValue();
    methodCodingCollection = v5->_methodCodingCollection;
    v5->_methodCodingCollection = (HKMedicalCodingCollection *)v33;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("Performers"));
    v36 = objc_claimAutoreleasedReturnValue();
    performers = v5->_performers;
    v5->_performers = (NSArray *)v36;

    v5->_referenceRangeStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ReferenceRangeStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DiagnosticTest"));
    v38 = objc_claimAutoreleasedReturnValue();
    diagnosticTest = v5->_diagnosticTest;
    v5->_diagnosticTest = (HKConcept *)v38;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("Categories"));
    v41 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v43 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v43;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("Interpretation"));
    v46 = objc_claimAutoreleasedReturnValue();
    interpretation = v5->_interpretation;
    v5->_interpretation = (NSArray *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BodySite"));
    v48 = objc_claimAutoreleasedReturnValue();
    bodySite = v5->_bodySite;
    v5->_bodySite = (HKConcept *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Method"));
    v50 = objc_claimAutoreleasedReturnValue();
    method = v5->_method;
    v5->_method = (HKConcept *)v50;

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
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  int64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  char v129;
  objc_super v131;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v131.receiver = self;
    v131.super_class = (Class)HKDiagnosticTestResult;
    if (!-[HKMedicalRecord isEquivalent:](&v131, sel_isEquivalent_, v5))
      goto LABEL_105;
    -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diagnosticTestCodingCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "diagnosticTestCodingCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_104;
      v10 = (void *)v9;
      -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnosticTestCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "value");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_104;
      v17 = (void *)v16;
      -[HKDiagnosticTestResult value](self, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult referenceRanges](self, "referenceRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceRanges");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "referenceRanges");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_104;
      v23 = (void *)v22;
      -[HKDiagnosticTestResult referenceRanges](self, "referenceRanges");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "referenceRanges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToArray:", v25);

      if (!v26)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult effectiveStartDate](self, "effectiveStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveStartDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "effectiveStartDate");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_104;
      v29 = (void *)v28;
      -[HKDiagnosticTestResult effectiveStartDate](self, "effectiveStartDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveStartDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult category](self, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "category");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_104;
      v35 = (void *)v34;
      -[HKDiagnosticTestResult category](self, "category");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

      if (!v38)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoriesCodingCollections");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "categoriesCodingCollections");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_104;
      v41 = (void *)v40;
      -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoriesCodingCollections");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqualToArray:", v43);

      if (!v44)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult issueDate](self, "issueDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issueDate");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "issueDate");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_104;
      v47 = (void *)v46;
      -[HKDiagnosticTestResult issueDate](self, "issueDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "issueDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult effectiveEndDate](self, "effectiveEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveEndDate");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "effectiveEndDate");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_104;
      v53 = (void *)v52;
      -[HKDiagnosticTestResult effectiveEndDate](self, "effectiveEndDate");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveEndDate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "statusCoding");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_104;
      v59 = (void *)v58;
      -[HKDiagnosticTestResult statusCoding](self, "statusCoding");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interpretationCodingCollections");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

    }
    else
    {
      v8 = (void *)v63;
      objc_msgSend(v5, "interpretationCodingCollections");
      v64 = objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_104;
      v65 = (void *)v64;
      -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interpretationCodingCollections");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqualToArray:", v67);

      if (!v68)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult comments](self, "comments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comments");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v69)
    {

    }
    else
    {
      v8 = (void *)v69;
      objc_msgSend(v5, "comments");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_104;
      v71 = (void *)v70;
      -[HKDiagnosticTestResult comments](self, "comments");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "comments");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "isEqualToString:", v73);

      if (!v74)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySiteCodingCollection");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v75)
    {

    }
    else
    {
      v8 = (void *)v75;
      objc_msgSend(v5, "bodySiteCodingCollection");
      v76 = objc_claimAutoreleasedReturnValue();
      if (!v76)
        goto LABEL_104;
      v77 = (void *)v76;
      -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySiteCodingCollection");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "isEqual:", v79);

      if (!v80)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "methodCodingCollection");
    v81 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v81)
    {

    }
    else
    {
      v8 = (void *)v81;
      objc_msgSend(v5, "methodCodingCollection");
      v82 = objc_claimAutoreleasedReturnValue();
      if (!v82)
        goto LABEL_104;
      v83 = (void *)v82;
      -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "methodCodingCollection");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult performers](self, "performers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performers");
    v87 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v87)
    {

    }
    else
    {
      v8 = (void *)v87;
      objc_msgSend(v5, "performers");
      v88 = objc_claimAutoreleasedReturnValue();
      if (!v88)
        goto LABEL_104;
      v89 = (void *)v88;
      -[HKDiagnosticTestResult performers](self, "performers");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performers");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqualToArray:", v91);

      if (!v92)
        goto LABEL_105;
    }
    v93 = -[HKDiagnosticTestResult referenceRangeStatus](self, "referenceRangeStatus");
    if (v93 != objc_msgSend(v5, "referenceRangeStatus"))
      goto LABEL_105;
    -[HKDiagnosticTestResult diagnosticTest](self, "diagnosticTest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diagnosticTest");
    v94 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v94)
    {

    }
    else
    {
      v8 = (void *)v94;
      objc_msgSend(v5, "diagnosticTest");
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95)
        goto LABEL_104;
      v96 = (void *)v95;
      -[HKDiagnosticTestResult diagnosticTest](self, "diagnosticTest");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnosticTest");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v97, "isEqual:", v98);

      if (!v99)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categories");
    v100 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v100)
    {

    }
    else
    {
      v8 = (void *)v100;
      objc_msgSend(v5, "categories");
      v101 = objc_claimAutoreleasedReturnValue();
      if (!v101)
        goto LABEL_104;
      v102 = (void *)v101;
      -[HKDiagnosticTestResult categories](self, "categories");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categories");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v103, "isEqualToArray:", v104);

      if (!v105)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v106 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v106)
    {

    }
    else
    {
      v8 = (void *)v106;
      objc_msgSend(v5, "status");
      v107 = objc_claimAutoreleasedReturnValue();
      if (!v107)
        goto LABEL_104;
      v108 = (void *)v107;
      -[HKDiagnosticTestResult status](self, "status");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v109, "isEqual:", v110);

      if (!v111)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult interpretation](self, "interpretation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interpretation");
    v112 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v112)
    {

    }
    else
    {
      v8 = (void *)v112;
      objc_msgSend(v5, "interpretation");
      v113 = objc_claimAutoreleasedReturnValue();
      if (!v113)
        goto LABEL_104;
      v114 = (void *)v113;
      -[HKDiagnosticTestResult interpretation](self, "interpretation");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interpretation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v115, "isEqualToArray:", v116);

      if (!v117)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult bodySite](self, "bodySite");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySite");
    v118 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v118)
    {

    }
    else
    {
      v8 = (void *)v118;
      objc_msgSend(v5, "bodySite");
      v119 = objc_claimAutoreleasedReturnValue();
      if (!v119)
        goto LABEL_104;
      v120 = (void *)v119;
      -[HKDiagnosticTestResult bodySite](self, "bodySite");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySite");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v121, "isEqual:", v122);

      if (!v123)
        goto LABEL_105;
    }
    -[HKDiagnosticTestResult method](self, "method");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "method");
    v124 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v124)
    {

LABEL_109:
      v14 = 1;
      goto LABEL_106;
    }
    v8 = (void *)v124;
    objc_msgSend(v5, "method");
    v125 = objc_claimAutoreleasedReturnValue();
    if (v125)
    {
      v126 = (void *)v125;
      -[HKDiagnosticTestResult method](self, "method");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "method");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v127, "isEqual:", v128);

      if ((v129 & 1) != 0)
        goto LABEL_109;
LABEL_105:
      v14 = 0;
LABEL_106:

      goto LABEL_107;
    }
LABEL_104:

    goto LABEL_105;
  }
  v14 = 0;
LABEL_107:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKDiagnosticTestResult statusCoding](self, "statusCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalCodingCollection)diagnosticTestCodingCollection
{
  return self->_diagnosticTestCodingCollection;
}

- (void)_setDiagnosticTestCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *diagnosticTestCodingCollection;
  HKConcept *v6;
  HKConcept *diagnosticTest;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  diagnosticTestCodingCollection = self->_diagnosticTestCodingCollection;
  self->_diagnosticTestCodingCollection = v4;

  -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v6;

}

- (HKInspectableValueCollection)value
{
  return self->_value;
}

- (void)_setValue:(id)a3
{
  HKInspectableValueCollection *v4;
  HKInspectableValueCollection *value;

  v4 = (HKInspectableValueCollection *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (NSArray)referenceRanges
{
  return self->_referenceRanges;
}

- (void)_setReferenceRanges:(id)a3
{
  NSArray *v4;
  NSArray *referenceRanges;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  referenceRanges = self->_referenceRanges;
  self->_referenceRanges = v4;

}

- (HKMedicalDate)effectiveStartDate
{
  return self->_effectiveStartDate;
}

- (void)_setEffectiveStartDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *effectiveStartDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  effectiveStartDate = self->_effectiveStartDate;
  self->_effectiveStartDate = v4;

}

- (NSString)category
{
  return self->_category;
}

- (void)_setCategory:(id)a3
{
  NSString *v4;
  NSString *category;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  category = self->_category;
  self->_category = v4;

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

  -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_70);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;

}

id __58__HKDiagnosticTestResult__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalDate)issueDate
{
  return self->_issueDate;
}

- (void)_setIssueDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *issueDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  issueDate = self->_issueDate;
  self->_issueDate = v4;

}

- (HKMedicalDate)effectiveEndDate
{
  return self->_effectiveEndDate;
}

- (void)_setEffectiveEndDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *effectiveEndDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  effectiveEndDate = self->_effectiveEndDate;
  self->_effectiveEndDate = v4;

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

  -[HKDiagnosticTestResult statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (NSArray)interpretationCodingCollections
{
  return self->_interpretationCodingCollections;
}

- (void)_setInterpretationCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *interpretationCodingCollections;
  NSArray *v6;
  NSArray *interpretation;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  interpretationCodingCollections = self->_interpretationCodingCollections;
  self->_interpretationCodingCollections = v4;

  if (self->_interpretationCodingCollections)
  {
    -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_111_0);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    interpretation = self->_interpretation;
    self->_interpretation = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_interpretation;
    self->_interpretation = 0;
  }

}

id __62__HKDiagnosticTestResult__setInterpretationCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (NSString)comments
{
  return self->_comments;
}

- (void)_setComments:(id)a3
{
  NSString *v4;
  NSString *comments;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  comments = self->_comments;
  self->_comments = v4;

}

- (HKMedicalCodingCollection)bodySiteCodingCollection
{
  return self->_bodySiteCodingCollection;
}

- (void)_setBodySiteCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *bodySiteCodingCollection;
  HKConcept *v6;
  HKConcept *bodySite;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  bodySiteCodingCollection = self->_bodySiteCodingCollection;
  self->_bodySiteCodingCollection = v4;

  if (self->_bodySiteCodingCollection)
  {
    -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    bodySite = self->_bodySite;
    self->_bodySite = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_bodySite;
    self->_bodySite = 0;
  }

}

- (HKMedicalCodingCollection)methodCodingCollection
{
  return self->_methodCodingCollection;
}

- (void)_setMethodCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *methodCodingCollection;
  HKConcept *v6;
  HKConcept *method;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  methodCodingCollection = self->_methodCodingCollection;
  self->_methodCodingCollection = v4;

  if (self->_methodCodingCollection)
  {
    -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    method = self->_method;
    self->_method = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_method;
    self->_method = 0;
  }

}

- (NSArray)performers
{
  return self->_performers;
}

- (void)_setPerformers:(id)a3
{
  NSArray *v4;
  NSArray *performers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  performers = self->_performers;
  self->_performers = v4;

}

- (int64_t)referenceRangeStatus
{
  return self->_referenceRangeStatus;
}

- (void)_setReferenceRangeStatus:(int64_t)a3
{
  self->_referenceRangeStatus = a3;
}

- (HKConcept)diagnosticTest
{
  HKConcept *diagnosticTest;
  HKConcept *v3;
  void *v4;

  diagnosticTest = self->_diagnosticTest;
  if (diagnosticTest)
  {
    v3 = diagnosticTest;
  }
  else
  {
    -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setDiagnosticTest:(id)a3
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
  HKConcept *diagnosticTest;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKDiagnosticTestResult _setDiagnosticTest:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v13;

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
    -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_112_0);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __36__HKDiagnosticTestResult_categories__block_invoke(uint64_t a1, uint64_t a2)
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
      -[HKDiagnosticTestResult _setCategories:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (NSArray *)objc_msgSend(v4, "copy");
  categories = self->_categories;
  self->_categories = v13;

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
    -[HKDiagnosticTestResult statusCodingCollection](self, "statusCodingCollection");
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
      -[HKDiagnosticTestResult _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (NSArray)interpretation
{
  NSArray *interpretation;
  NSArray *v3;
  void *v4;

  if (self->_interpretationCodingCollections)
  {
    interpretation = self->_interpretation;
    if (interpretation)
    {
      v3 = interpretation;
    }
    else
    {
      -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_113);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __40__HKDiagnosticTestResult_interpretation__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setInterpretation:(id)a3
{
  NSArray *v4;
  NSArray *interpretation;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  interpretation = self->_interpretation;
  self->_interpretation = v4;

}

- (HKConcept)bodySite
{
  HKConcept *bodySite;
  HKConcept *v3;
  void *v4;

  if (self->_bodySiteCodingCollection)
  {
    bodySite = self->_bodySite;
    if (bodySite)
    {
      v3 = bodySite;
    }
    else
    {
      -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setBodySite:(id)a3
{
  HKConcept *v4;
  HKConcept *bodySite;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  bodySite = self->_bodySite;
  self->_bodySite = v4;

}

- (HKConcept)method
{
  HKConcept *method;
  HKConcept *v3;
  void *v4;

  if (self->_methodCodingCollection)
  {
    method = self->_method;
    if (method)
    {
      v3 = method;
    }
    else
    {
      -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setMethod:(id)a3
{
  HKConcept *v4;
  HKConcept *method;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  method = self->_method;
  self->_method = v4;

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
  v13.super_class = (Class)HKDiagnosticTestResult;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_13:
    v8 = v7;
    goto LABEL_14;
  }
  if (!self->_diagnosticTestCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: diagnosticTestCodingCollection must not be nil");
LABEL_12:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!self->_category)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: category must not be nil");
    goto LABEL_12;
  }
  if (!self->_categoriesCodingCollections)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: categoriesCodingCollections must not be nil");
    goto LABEL_12;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_bodySite, 0);
  objc_storeStrong((id *)&self->_interpretation, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_diagnosticTest, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_methodCodingCollection, 0);
  objc_storeStrong((id *)&self->_bodySiteCodingCollection, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_interpretationCodingCollections, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_referenceRanges, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_diagnosticTestCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("diagnosticTest"));
  objc_msgSend(v3, "addObject:", CFSTR("categories"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("interpretation"));
  objc_msgSend(v3, "addObject:", CFSTR("bodySite"));
  objc_msgSend(v3, "addObject:", CFSTR("method"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestResult;
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
  void **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("diagnosticTest")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("categories")))
    {
      -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = (void *)v14;
      +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v14, v6, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    {
      -[HKDiagnosticTestResult statusCoding](self, "statusCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("interpretation")))
    {
      -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("bodySite")))
    {
      -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v24;
        goto LABEL_4;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("method")))
      {
        v22.receiver = self;
        v22.super_class = (Class)HKDiagnosticTestResult;
        -[HKMedicalRecord codingsForKeyPath:error:](&v22, sel_codingsForKeyPath_error_, v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v23;
        goto LABEL_4;
      }
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  -[HKDiagnosticTestResult diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = (void **)v26;
LABEL_4:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v13;
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_13;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("diagnosticTest")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("categories")))
    {
      -[HKDiagnosticTestResult categoriesCodingCollections](self, "categoriesCodingCollections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v13, "count"), v9, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = v14 != 0;
      if (v14)
        -[HKDiagnosticTestResult _setCategories:](self, "_setCategories:", v14);
LABEL_9:

      goto LABEL_14;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
    {
      if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
      {
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKDiagnosticTestResult _setStatus:](self, "_setStatus:", v12);
        goto LABEL_5;
      }
LABEL_13:
      LOBYTE(a5) = 0;
      goto LABEL_14;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("interpretation")))
    {
      -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKDiagnosticTestResult interpretationCodingCollections](self, "interpretationCodingCollections");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v17, "count"), v9, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v14 != 0;
        if (v14)
          -[HKDiagnosticTestResult _setInterpretation:](self, "_setInterpretation:", v14);
        goto LABEL_9;
      }
      v22 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("bodySite")))
      {
        v18 = objc_msgSend(v8, "count");
        -[HKDiagnosticTestResult bodySiteCodingCollection](self, "bodySiteCodingCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!(_DWORD)a5)
          goto LABEL_14;
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKDiagnosticTestResult _setBodySite:](self, "_setBodySite:", v12);
        goto LABEL_5;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("method")))
      {
        v20 = objc_msgSend(v8, "count");
        -[HKDiagnosticTestResult methodCodingCollection](self, "methodCodingCollection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v20, v21 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!(_DWORD)a5)
          goto LABEL_14;
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKDiagnosticTestResult _setMethod:](self, "_setMethod:", v12);
        goto LABEL_5;
      }
      v23.receiver = self;
      v23.super_class = (Class)HKDiagnosticTestResult;
      v22 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v23, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
    }
    LOBYTE(a5) = v22;
    goto LABEL_14;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    goto LABEL_13;
  objc_msgSend(v8, "firstObject");
  a5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDiagnosticTestResult _setDiagnosticTest:](self, "_setDiagnosticTest:", v12);
LABEL_5:

  LOBYTE(a5) = 1;
LABEL_14:

  return (char)a5;
}

- (void)_setDiagnosticTest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property diagnosticTest for record type HKDiagnosticTestResult.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_setCategories:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property categories for record type HKDiagnosticTestResult.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKDiagnosticTestResult.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

@end
