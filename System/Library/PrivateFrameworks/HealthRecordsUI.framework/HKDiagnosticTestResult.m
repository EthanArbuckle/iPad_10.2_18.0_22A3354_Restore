@implementation HKDiagnosticTestResult

void __102__HKDiagnosticTestResult_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  HRMedicalRecordFormatter *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = -[HRMedicalRecordFormatter initWithConceptStore:context:]([HRMedicalRecordFormatter alloc], "initWithConceptStore:context:", a1[4], 0);
  -[HRMedicalRecordFormatter displayItemsFromRecord:](v4, "displayItemsFromRecord:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __106__HKDiagnosticTestResult_Displayable__fetchObservationDetailItemsWithHealthRecordsStore_style_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayItemsForValuePreferedStyle:healthRecordsStore:signedClinicalDataRecord:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

void __129__HKDiagnosticTestResult_Displayable___displayItemsForValuePreferedStyle_healthRecordsStore_signedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a2;
  v9 = a4;
  if (*(_BYTE *)(a1 + 80))
    a3 = *(void **)(a1 + 32);
  v10 = a3;
  if (v39 && objc_msgSend(v39, "hasRenderableContent"))
  {
    v11 = *(_QWORD *)(a1 + 72);
    if (v11 < 2)
    {
      +[WDMedicalRecordDisplayItem timelineSummaryReferenceRangeItem](WDMedicalRecordDisplayItem, "timelineSummaryReferenceRangeItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setChartValueWithRange:", v39);
      objc_msgSend(v12, "setSeparatorStyle:", 0);
      objc_msgSend(v12, "setSeparatorHidden:", 0);
LABEL_10:
      objc_msgSend(v12, "setMedicalRecord:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "meaningfulDateTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSubtitle:", v16);

      v17 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "meaningfulDateTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributedMeaningfulDateStringWithDateTitle:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributedSubtitle:", v19);

LABEL_18:
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
LABEL_19:

      goto LABEL_20;
    }
    if (v11 == 2)
    {
      +[WDMedicalRecordDisplayItem timelineSummaryReferenceRangeItem](WDMedicalRecordDisplayItem, "timelineSummaryReferenceRangeItem");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setChartValueWithRange:", v39);
      objc_msgSend(v12, "setSeparatorStyle:", 0);
      objc_msgSend(v12, "setSeparatorHidden:", 0);
      objc_msgSend(v12, "setMedicalRecord:", *(_QWORD *)(a1 + 40));
      goto LABEL_18;
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 72);
    if (v13 < 2)
    {
      +[WDMedicalRecordDisplayItem timelineSummaryValueItem](WDMedicalRecordDisplayItem, "timelineSummaryValueItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (!a5)
      {
        objc_msgSend(v14, "setValueString:", v10);
        objc_msgSend(v12, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
        objc_msgSend(v12, "setPlacement:", 5);
        objc_msgSend(v12, "setSeparatorStyle:", 0);
        objc_msgSend(v12, "setSeparatorHidden:", 1);
        objc_msgSend(v12, "setMedicalRecord:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 40), "meaningfulDateTitle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSubtitle:", v26);

        v27 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "meaningfulDateTitle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "attributedMeaningfulDateStringWithDateTitle:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAttributedSubtitle:", v29);

        if (v9)
        {
          +[HRProfileManager sharedInstance](HRProfileManager, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "currentProfile");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "ucumDisplayConverter");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "synonymForUCUMUnitString:", v9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setUnitString:", v33);

        }
        goto LABEL_18;
      }
      HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValueString:", v15);

      objc_msgSend(v12, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
      objc_msgSend(v12, "setPlacement:", 5);
      objc_msgSend(v12, "setSeparatorStyle:", 0);
      objc_msgSend(v12, "setSeparatorHidden:", 1);
      objc_msgSend(v12, "setTitle:", 0);
      goto LABEL_10;
    }
    if (v13 == 2)
    {
      if (a5)
      {
        v20 = *(void **)(a1 + 56);
        HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_VALUE"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:", v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v23);

        v24 = *(void **)(a1 + 56);
        HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_DATA_ABSENT_REASON"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:", v12, v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v25);

      }
      else
      {
        if (v9)
        {
          v34 = (void *)MEMORY[0x1E0CB3940];
          HRLocalizedString(CFSTR("MEDICAL_RECORD_VALUE_UNIT_JOINT_%1$@_%2$@"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", v35, v10, v9);
          v12 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = v10;
        }
        v36 = *(void **)(a1 + 56);
        HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_VALUE"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:", v37, v12);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v38);

      }
      goto LABEL_19;
    }
  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  BOOL v21;

  v15 = a2;
  objc_msgSend(v15, "codings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "codedValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") - 1 == a3;

    v8 = (void *)MEMORY[0x1E0CB67D8];
    objc_msgSend(v15, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inspectableValueCollectionSingleWithValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB67D8];
    objc_msgSend(v15, "referenceRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2;
    v16[3] = &unk_1E74D1768;
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 64);
    v16[4] = v13;
    v16[1] = 3221225472;
    v21 = v7;
    v17 = v14;
    v18 = *(id *)(a1 + 56);
    v19 = v15;
    objc_msgSend(v11, "parseUncodedValueCollection:referenceRanges:withCompletion:", v10, v12, v16);

  }
}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 64);
  if (v13 < 2)
  {
    if (a5)
    {
      +[WDMedicalRecordDisplayItem timelineSummaryValueItem](WDMedicalRecordDisplayItem, "timelineSummaryValueItem");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValueString:", v15);

      objc_msgSend(v14, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 32), "recordCategoryType"));
      objc_msgSend(v14, "setPlacement:", 4);
      objc_msgSend(v14, "setSeparatorStyle:", 0);
      objc_msgSend(v14, "setSeparatorHidden:", 0);
      objc_msgSend(v14, "setTitle:", 0);
      objc_msgSend(v14, "setMedicalRecord:", *(_QWORD *)(a1 + 32));
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 32), "meaningfulDateTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSubtitle:", v16);

        v17 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "meaningfulDateTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attributedMeaningfulDateStringWithDateTitle:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAttributedSubtitle:", v19);

      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 56), "ontologyConcept");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedPreferredName");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    +[WDMedicalRecordDisplayItem timelineSummaryValueItem](WDMedicalRecordDisplayItem, "timelineSummaryValueItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setValueString:", v10);
    objc_msgSend(v29, "setRecordCategoryType:", objc_msgSend(*(id *)(a1 + 32), "recordCategoryType"));
    objc_msgSend(v29, "setPlacement:", 4);
    objc_msgSend(v29, "setSeparatorStyle:", 0);
    objc_msgSend(v29, "setSeparatorHidden:", 0);
    objc_msgSend(v29, "setTitle:", v14);
    objc_msgSend(v29, "setMedicalRecord:", *(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "meaningfulDateTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSubtitle:", v30);

      v31 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "meaningfulDateTitle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "attributedMeaningfulDateStringWithDateTitle:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAttributedSubtitle:", v33);

    }
    if (v12)
    {
      +[HRProfileManager sharedInstance](HRProfileManager, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "currentProfile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "ucumDisplayConverter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "synonymForUCUMUnitString:", v12);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setUnitString:", v37);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (v13 == 2)
  {
    if (!a5)
    {
      if (v11)
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        HRLocalizedString(CFSTR("MEDICAL_RECORD_VALUE_UNIT_JOINT_%1$@_%2$@"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", v39, v10, v12);
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = v10;
      }
      objc_msgSend(*(id *)(a1 + 56), "ontologyConcept");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedPreferredName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "hk_copyNonEmptyString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = v41;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB6620], "defaultDisplayString");
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      v44 = v43;

      v45 = *(void **)(a1 + 48);
      +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v44, v14, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v46);

      goto LABEL_23;
    }
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2_cold_1(v20);
    v21 = *(void **)(a1 + 48);
    HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_VALUE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_VALUE_DATA_ABSENT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

    v25 = *(void **)(a1 + 48);
    HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_DATA_ABSENT_REASON"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:", v26, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v27);

  }
LABEL_25:

}

void __146__HKDiagnosticTestResult_Displayable___displayItemsForCodedValueCollection_healthRecordsStore_preferredStyle_signedClinicalDataRecord_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC30A000, log, OS_LOG_TYPE_ERROR, "Encountered unexpected data absent reason in coded value collection.", v1, 2u);
}

@end
