@implementation HKDiagnosticTestResult(Displayable)

- (id)title
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticTestResultCategoryFromNSString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == (void *)*MEMORY[0x1E0CB4CB0])
  {
    v4 = CFSTR("LAB_DETAIL_TITLE");
LABEL_6:
    HRLocalizedString(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v2 == (void *)*MEMORY[0x1E0CB4CB8])
  {
    v4 = CFSTR("VITAL_DETAIL_TITLE");
    goto LABEL_6;
  }
  v3 = 0;
LABEL_7:

  return v3;
}

- (id)codings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "diagnosticTestCodingCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__HKDiagnosticTestResult_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke;
  v12[3] = &unk_1E74D16F0;
  v13 = v8;
  v14 = a1;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "_displayItemsForValuePreferedStyle:healthRecordsStore:signedClinicalDataRecord:completion:", 2, a3, 0, v12);

}

- (void)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__HKDiagnosticTestResult_Displayable__fetchObservationDetailItemsWithHealthRecordsStore_style_completion___block_invoke;
  v12[3] = &unk_1E74D1718;
  v12[4] = a1;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:completion:", v11, v12);

}

- (void)_displayItemsForValuePreferedStyle:()Displayable healthRecordsStore:signedClinicalDataRecord:completion:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  char v40;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a1, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inspectableValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "codedValueCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "canonicalBloodPressureDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "primaryConcept");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "groupByConcept");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "chartsBloodPressure");
  if (v16)
    v20 = v19;
  else
    v20 = 0;

  objc_msgSend(a1, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "inspectableValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "valueType");

  objc_msgSend(a1, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 != 8 || (v20 & 1) != 0)
  {

    if (v25)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v32 = (void *)MEMORY[0x1E0CB67D8];
      objc_msgSend(a1, "value");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "referenceRanges");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __129__HKDiagnosticTestResult_Displayable___displayItemsForValuePreferedStyle_healthRecordsStore_signedClinicalDataRecord_completion___block_invoke;
      v33[3] = &unk_1E74D1740;
      v40 = v20;
      v39 = a3;
      v34 = v16;
      v35 = a1;
      v36 = v11;
      v37 = v28;
      v38 = v12;
      v31 = v28;
      objc_msgSend(v32, "parseValueCollection:referenceRanges:healthRecordsStore:withCompletion:", v29, v30, v10, v33);

    }
    else
    {
      (*((void (**)(id, _QWORD))v12 + 2))(v12, MEMORY[0x1E0C9AA60]);
    }
  }
  else
  {
    objc_msgSend(v24, "inspectableValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "codedValueCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_displayItemsForCodedValueCollection:healthRecordsStore:preferredStyle:signedClinicalDataRecord:completion:", v27, v10, a3, v11, v12);

  }
}

- (void)_displayItemsForCodedValueCollection:()Displayable healthRecordsStore:preferredStyle:signedClinicalDataRecord:completion:
{
  id v11;
  id v12;
  void *v13;
  void (**v14)(id, id);
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;

  v11 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  v14 = a7;
  objc_msgSend(v13, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "codedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke;
  v20[3] = &unk_1E74D1790;
  v24 = v15;
  v25 = a5;
  v21 = v11;
  v22 = a1;
  v23 = v12;
  v17 = v15;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

  v14[2](v14, v17);
}

- (id)titleDisplayStringForDetailViewController
{
  void *v1;
  void *v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticTestResultCategoryFromNSString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == (void *)*MEMORY[0x1E0CB4CB8])
    v3 = CFSTR("RECORD_DETAIL_VITAL_TITLE");
  else
    v3 = CFSTR("RECORD_DETAIL_UNKNOWN_RECORD_TITLE");
  if (v2 == (void *)*MEMORY[0x1E0CB4CB0])
    v4 = CFSTR("RECORD_DETAIL_LAB_TITLE");
  else
    v4 = v3;
  HRLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
