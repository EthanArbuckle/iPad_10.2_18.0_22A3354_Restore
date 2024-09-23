@implementation HKDiagnosticTestReport

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("diagnosticTest"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
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
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("diagnosticTest")))
    {
      -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
      {
        v14.receiver = self;
        v14.super_class = (Class)HKDiagnosticTestReport;
        -[HKMedicalRecord codingsForKeyPath:error:](&v14, sel_codingsForKeyPath_error_, v6, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[HKDiagnosticTestReport statusCoding](self, "statusCoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
LABEL_9:

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
  BOOL v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_9;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("diagnosticTest")))
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
    {
      v16.receiver = self;
      v16.super_class = (Class)HKDiagnosticTestReport;
      v14 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v16, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
      goto LABEL_10;
    }
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDiagnosticTestReport _setStatus:](self, "_setStatus:", v13);
      goto LABEL_8;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    goto LABEL_9;
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDiagnosticTestReport _setDiagnosticTest:](self, "_setDiagnosticTest:", v13);
LABEL_8:

  v14 = 1;
LABEL_10:

  return v14;
}

+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 diagnosticTestCodingCollection:(id)a14 results:(id)a15 effectiveStartDate:(id)a16 statusCoding:(id)a17 effectiveEndDate:(id)a18 issueDate:(id)a19
{
  id v20;
  __CFString *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  __CFString *v34;
  id v35;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _BOOL4 v46;
  id v48;
  id v49;

  v46 = a5;
  v49 = a16;
  v20 = a18;
  v21 = CFSTR("issueDate");
  v22 = a19;
  v45 = a17;
  v44 = a15;
  v43 = a14;
  v23 = v20;
  v35 = a12;
  v42 = a11;
  v41 = a10;
  v40 = a8;
  v48 = a7;
  v24 = a6;
  v39 = a4;
  v37 = a3;
  objc_msgSend(v22, "dateForUTC");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v26 = CFSTR("effectiveEndDate");

    objc_msgSend(v23, "dateForUTC");
    v27 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v27;
    v21 = v26;
  }
  if (v49)
  {
    v28 = CFSTR("effectiveStartDate");

    objc_msgSend(v49, "dateForUTC");
    v29 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v29;
    v21 = v28;
  }
  v34 = v21;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v21, v25);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDiagnosticTestReport diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:](HKDiagnosticTestReport, "diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:", v37, v39, v46, v24, v48, v40, a9, v41, v42, v32, v35, a13, v43, v44, v49, v45,
    v23,
    v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
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
  return 2;
}

+ (id)diagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newDiagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           0));
}

+ (id)_newDiagnosticTestReportWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 diagnosticTestCodingCollection:(id)a15 results:(id)a16 effectiveStartDate:(id)a17 statusCoding:(id)a18 effectiveEndDate:(id)a19 issueDate:(id)a20 config:(id)a21
{
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
  id v35;
  id v36;
  void *v37;
  _BOOL4 v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  _QWORD aBlock[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;

  v45 = a5;
  v21 = a15;
  v22 = a16;
  v23 = a17;
  v24 = a18;
  v25 = a19;
  v26 = a20;
  v27 = a21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __278__HKDiagnosticTestReport__newDiagnosticTestReportWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_results_effectiveStartDate_statusCoding_effectiveEndDate_issueDate_config___block_invoke;
  aBlock[3] = &unk_1E37F1E10;
  v56 = v21;
  v57 = v22;
  v58 = v23;
  v59 = v24;
  v60 = v25;
  v61 = v26;
  v62 = v27;
  v53 = v27;
  v52 = v26;
  v51 = v25;
  v50 = v24;
  v49 = v23;
  v48 = v22;
  v47 = v21;
  v28 = a13;
  v29 = a12;
  v30 = a11;
  v31 = a10;
  v32 = a8;
  v33 = a7;
  v34 = a6;
  v35 = a4;
  v36 = a3;
  v37 = _Block_copy(aBlock);
  v54.receiver = a1;
  v54.super_class = (Class)&OBJC_METACLASS___HKDiagnosticTestReport;
  v46 = objc_msgSendSuper2(&v54, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v36, v35, v45, v34, v33, v32, a9, v31, v30, v29, v28, a14, v37);

  return v46;
}

void __278__HKDiagnosticTestReport__newDiagnosticTestReportWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_diagnosticTestCodingCollection_results_effectiveStartDate_statusCoding_effectiveEndDate_issueDate_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v16;

  v16 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v16[22];
  v16[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v16[23];
  v16[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v16[24];
  v16[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v16[25];
  v16[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v16[26];
  v16[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v16[27];
  v16[27] = v13;

  v15 = *(_QWORD *)(a1 + 80);
  if (v15)
    (*(void (**)(uint64_t, _QWORD *))(v15 + 16))(v15, v16);

}

- (HKDiagnosticTestReport)init
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
  v9.super_class = (Class)HKDiagnosticTestReport;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@diagnosticTestCodingCollection = %@results = %@effectiveStartDate = %@statusCoding = %@effectiveEndDate = %@issueDate = %@>"), v5, self, v6, self->_diagnosticTestCodingCollection, self->_results, self->_effectiveStartDate, self->_statusCoding, self->_effectiveEndDate, self->_issueDate);
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
  v5.super_class = (Class)HKDiagnosticTestReport;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTestCodingCollection, CFSTR("DiagnosticTestCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, CFSTR("Results"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveStartDate, CFSTR("EffectiveStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_effectiveEndDate, CFSTR("EffectiveEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issueDate, CFSTR("IssueDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_diagnosticTest, CFSTR("DiagnosticTest"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));

}

- (HKDiagnosticTestReport)initWithCoder:(id)a3
{
  id v4;
  HKDiagnosticTestReport *v5;
  uint64_t v6;
  HKMedicalCodingCollection *diagnosticTestCodingCollection;
  void *v8;
  uint64_t v9;
  NSArray *results;
  uint64_t v11;
  HKMedicalDate *effectiveStartDate;
  uint64_t v13;
  HKMedicalCoding *statusCoding;
  uint64_t v15;
  HKMedicalDate *effectiveEndDate;
  uint64_t v17;
  HKMedicalDate *issueDate;
  uint64_t v19;
  HKConcept *diagnosticTest;
  uint64_t v21;
  HKConcept *status;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HKDiagnosticTestReport;
  v5 = -[HKMedicalRecord initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DiagnosticTestCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    diagnosticTestCodingCollection = v5->_diagnosticTestCodingCollection;
    v5->_diagnosticTestCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Results"));
    v9 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveStartDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    effectiveStartDate = v5->_effectiveStartDate;
    v5->_effectiveStartDate = (HKMedicalDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v13 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EffectiveEndDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    effectiveEndDate = v5->_effectiveEndDate;
    v5->_effectiveEndDate = (HKMedicalDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IssueDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    issueDate = v5->_issueDate;
    v5->_issueDate = (HKMedicalDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DiagnosticTest"));
    v19 = objc_claimAutoreleasedReturnValue();
    diagnosticTest = v5->_diagnosticTest;
    v5->_diagnosticTest = (HKConcept *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v21 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v21;

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
  char v56;
  objc_super v58;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v58.receiver = self;
    v58.super_class = (Class)HKDiagnosticTestReport;
    if (!-[HKMedicalRecord isEquivalent:](&v58, sel_isEquivalent_, v5))
      goto LABEL_44;
    -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
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
        goto LABEL_43;
      v10 = (void *)v9;
      -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnosticTestCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "results");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "results");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_43;
      v17 = (void *)v16;
      -[HKDiagnosticTestReport results](self, "results");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "results");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToArray:", v19);

      if (!v20)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport effectiveStartDate](self, "effectiveStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveStartDate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "effectiveStartDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_43;
      v23 = (void *)v22;
      -[HKDiagnosticTestReport effectiveStartDate](self, "effectiveStartDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveStartDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "statusCoding");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_43;
      v29 = (void *)v28;
      -[HKDiagnosticTestReport statusCoding](self, "statusCoding");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport effectiveEndDate](self, "effectiveEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveEndDate");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "effectiveEndDate");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_43;
      v35 = (void *)v34;
      -[HKDiagnosticTestReport effectiveEndDate](self, "effectiveEndDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "effectiveEndDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport issueDate](self, "issueDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issueDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "issueDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_43;
      v41 = (void *)v40;
      -[HKDiagnosticTestReport issueDate](self, "issueDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "issueDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport diagnosticTest](self, "diagnosticTest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "diagnosticTest");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "diagnosticTest");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_43;
      v47 = (void *)v46;
      -[HKDiagnosticTestReport diagnosticTest](self, "diagnosticTest");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "diagnosticTest");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_44;
    }
    -[HKDiagnosticTestReport status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

LABEL_48:
      v14 = 1;
      goto LABEL_45;
    }
    v8 = (void *)v51;
    objc_msgSend(v5, "status");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v53 = (void *)v52;
      -[HKDiagnosticTestReport status](self, "status");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if ((v56 & 1) != 0)
        goto LABEL_48;
LABEL_44:
      v14 = 0;
LABEL_45:

      goto LABEL_46;
    }
LABEL_43:

    goto LABEL_44;
  }
  v14 = 0;
LABEL_46:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKDiagnosticTestReport statusCoding](self, "statusCoding");
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

  -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v6;

}

- (NSArray)results
{
  return self->_results;
}

- (void)_setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  results = self->_results;
  self->_results = v4;

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

  -[HKDiagnosticTestReport statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

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
    -[HKDiagnosticTestReport diagnosticTestCodingCollection](self, "diagnosticTestCodingCollection");
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
      -[HKDiagnosticTestReport _setDiagnosticTest:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  diagnosticTest = self->_diagnosticTest;
  self->_diagnosticTest = v13;

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
    -[HKDiagnosticTestReport statusCodingCollection](self, "statusCodingCollection");
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
      -[HKDiagnosticTestReport _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

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
  v13.super_class = (Class)HKDiagnosticTestReport;
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
  if (!self->_diagnosticTestCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: diagnosticTestCodingCollection must not be nil");
LABEL_10:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
    goto LABEL_10;
  }
  if (!self->_issueDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: issueDate must not be nil");
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
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_diagnosticTest, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_effectiveEndDate, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_effectiveStartDate, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_diagnosticTestCodingCollection, 0);
}

- (void)_setDiagnosticTest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property diagnosticTest for record type HKDiagnosticTestReport.", a5, a6, a7, a8, 0);
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKDiagnosticTestReport.", a5, a6, a7, a8, 0);
}

@end
