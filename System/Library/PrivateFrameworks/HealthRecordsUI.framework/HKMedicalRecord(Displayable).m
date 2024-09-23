@implementation HKMedicalRecord(Displayable)

- (uint64_t)title
{
  return 0;
}

- (const)subtitle
{
  return &stru_1E74EA150;
}

- (BOOL)isRemovedFromRemote
{
  return objc_msgSend(a1, "state") == 1;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  HRMedicalRecordFormatter *v10;

  v7 = a5;
  v8 = a4;
  v10 = -[HRMedicalRecordFormatter initWithConceptStore:context:]([HRMedicalRecordFormatter alloc], "initWithConceptStore:context:", v8, 0);

  -[HRMedicalRecordFormatter displayItemsFromRecord:](v10, "displayItemsFromRecord:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

}

- (void)fetchStructuredFieldItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  HRMedicalRecordFormatter *v11;

  v7 = a5;
  v8 = a4;
  v11 = -[HRMedicalRecordFormatter initWithConceptStore:context:]([HRMedicalRecordFormatter alloc], "initWithConceptStore:context:", v8, 0);

  -[HRMedicalRecordFormatter structuredItemsFromRecord:](v11, "structuredItemsFromRecord:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = v9;
  else
    v10 = 0;
  ((void (**)(id, void *))v7)[2](v7, v10);

}

- (void)fetchConceptRoomItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  HRMedicalRecordFormatter *v10;

  v7 = a5;
  v8 = a4;
  v10 = -[HRMedicalRecordFormatter initWithConceptStore:context:]([HRMedicalRecordFormatter alloc], "initWithConceptStore:context:", v8, 1);

  -[HRMedicalRecordFormatter displayItemsFromRecord:](v10, "displayItemsFromRecord:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

}

- (void)fetchDisplayNameItemWithHealthRecordsStore:()Displayable completion:
{
  void (**v5)(id, id);
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, id);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "codings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v21 = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(a1, "codings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "displayString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            objc_msgSend(v14, "displayString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "length"))
              objc_msgSend(v14, "displayString");
            else
              HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TEXT_NO_TEXT"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "formattedTitle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v19, v18, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v20);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    v5 = v21;
  }
  v5[2](v5, v6);

}

- (void)fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:()Displayable completion:
{
  id v6;
  void *v7;
  void *v8;
  WDClinicalSourcesDataProvider *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signedClinicalDataRecordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[WDClinicalSourcesDataProvider initWithHealthRecordsStore:]([WDClinicalSourcesDataProvider alloc], "initWithHealthRecordsStore:", v10);
    -[WDClinicalSourcesDataProvider fetchSignedClinicalDataRecordWithIdentifier:completion:](v9, "fetchSignedClinicalDataRecordWithIdentifier:completion:", v8, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)fetchAttachmentItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  void (**v7)(id, _QWORD, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HRMedicalRecordFormatter *v12;

  v7 = a5;
  v8 = a4;
  v12 = -[HRMedicalRecordFormatter initWithConceptStore:context:]([HRMedicalRecordFormatter alloc], "initWithConceptStore:context:", v8, 0);

  -[HRMedicalRecordFormatter attachmentItemsTitleFromRecord:](v12, "attachmentItemsTitleFromRecord:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMedicalRecordFormatter attachmentItemsFromRecord:](v12, "attachmentItemsFromRecord:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    v11 = v10;
  else
    v11 = 0;
  ((void (**)(id, void *, void *))v7)[2](v7, v11, v9);

}

- (id)conceptNameItems
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1, "primaryConcept");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupByConcept");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v3) = objc_msgSend(v4, "isAdHoc");
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberRepresentation");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if ((_DWORD)v3)
      v9 = CFSTR("Grouper Adhoc Concept (%@)");
    else
      v9 = CFSTR("Grouper Concept (%@)");
    objc_msgSend(v5, "stringWithFormat:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "displayNameForGroupByConcept");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v12);

    objc_msgSend(a1, "primaryConcept");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqual:", v4) & 1) == 0)
    {
      v14 = objc_msgSend(v13, "isAdHoc");
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberRepresentation");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v14)
        v19 = CFSTR("Primary Adhoc Concept (%@)");
      else
        v19 = CFSTR("Primary Concept (%@)");
      objc_msgSend(v15, "stringWithFormat:", v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "localizedPreferredName");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (const __CFString *)v21;
      else
        v23 = CFSTR("Primary Concept without CFN");
      +[WDMedicalRecordDisplayItem detailSubtitleItemWithTitle:subtitle:extraTopPadding:](WDMedicalRecordDisplayItem, "detailSubtitleItemWithTitle:subtitle:extraTopPadding:", v20, v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v24);

    }
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (uint64_t)fetchChartValueWithRangeWithHealthStore:()Displayable completion:
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

- (uint64_t)fetchObservationDetailItemsWithHealthRecordsStore:()Displayable style:completion:
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
}

- (uint64_t)codings
{
  return 0;
}

- (id)meaningfulDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if ((objc_msgSend(a1, "isDateLess") & 1) == 0)
  {
    objc_msgSend(a1, "sortDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valueForKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(a1, "sortDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(v5, "dateForUTC");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;
LABEL_9:

    return v2;
  }
  v2 = 0;
  return v2;
}

- (uint64_t)meaningfulDateString
{
  return objc_msgSend(a1, "meaningfulDateDisplayStringWithPreferredForm:showTime:", 0, 1);
}

- (uint64_t)isDisplayable
{
  return 1;
}

- (uint64_t)isDateLess
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "sortDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB53A8]);

  return v3;
}

- (uint64_t)canDefineConceptRoom
{
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(a1, "isDisplayable"))
    return 0;
  objc_msgSend(a1, "primaryConcept");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInMemory") ^ 1;

  return v3;
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_UNKNOWN_RECORD_TITLE"));
}

- (id)sortDateTitle
{
  void *v1;
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(a1, "sortDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB53A8]);

  if (v3)
  {
    HRLocalizedString(CFSTR("MEDICAL_RECORD_SORT_DATE_TITLE_MODIFIED_DATE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)meaningfulDateDisplayStringWithPreferredForm:()Displayable showTime:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (!objc_msgSend(a1, "isDateLess"))
  {
    objc_msgSend(a1, "sortDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valueForKeyPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "date");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
      objc_msgSend(v10, "dateValueForUTC");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;

    v10 = v12;
LABEL_8:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6840], "displayStringForDate:form:originalTimeZoneString:", v10, a3, 0);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v7 = (void *)v13;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        -[HKMedicalRecord(Displayable) meaningfulDateDisplayStringWithPreferredForm:showTime:].cold.1(v17);
      HRLocalizedString(CFSTR("NO_DATE"));
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v14 = v10;
    v15 = objc_msgSend(v14, "form");
    if ((a4 & 1) == 0)
    {
      if (!objc_msgSend(v14, "form"))
      {
        v16 = 1;
        goto LABEL_15;
      }
      v15 = objc_msgSend(v14, "form");
    }
    v16 = v15;
LABEL_15:
    objc_msgSend(v14, "displayStringWithPreferredForm:includeTimeZone:", v16, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
    return v7;
  }
  HRLocalizedString(CFSTR("NO_DATE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)meaningfulDateDisplayStringWithPreferredForm:()Displayable showTime:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_1BC30A000, v1, OS_LOG_TYPE_ERROR, "Unexpected sort date class: %{public}@", (uint8_t *)&v3, 0xCu);

  OUTLINED_FUNCTION_2();
}

@end
