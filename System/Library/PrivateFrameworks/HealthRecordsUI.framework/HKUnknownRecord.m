@implementation HKUnknownRecord

void __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
      __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke_cold_1(v7);
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "count"))
  {
    HRNewlineJoinedStrings();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_EXTRACTION_FAILURE_REASON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v10, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TITLE_NOTE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_1BC30A000, v1, OS_LOG_TYPE_DEBUG, "Error stringifying failure reasons: %{public}@", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_2();
}

@end
