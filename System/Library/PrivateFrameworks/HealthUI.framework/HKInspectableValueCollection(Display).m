@implementation HKInspectableValueCollection(Display)

- (id)displayString
{
  void *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "collectionType");
  if ((unint64_t)(v3 - 2) < 2)
  {
    objc_msgSend(a1, "inspectableValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_stringsForValues:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_joinValueStrings:", v8);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    return v1;
  }
  if (v3 == 1)
  {
    objc_msgSend(a1, "min");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(a1, "max");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_joinValueStrings:", v11);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (!v3)
  {
    objc_msgSend(a1, "inspectableValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  return v1;
}

- (id)_stringsForValues:()Display
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "displayString", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (uint64_t)_joinValueStrings:()Display
{
  return objc_msgSend(a3, "componentsJoinedByString:", CFSTR("/"));
}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, __CFString *, const __CFString *, uint64_t);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12 || objc_msgSend(v10, "collectionType"))
    goto LABEL_3;
  objc_msgSend(v10, "inspectableValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "valueType") == 7)
  {

  }
  else
  {
    objc_msgSend(v10, "inspectableValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "valueType");

    if (v16 != 9)
    {
LABEL_3:
      objc_msgSend(a1, "parseUncodedValueCollection:referenceRanges:withCompletion:", v10, v11, v13);
      goto LABEL_4;
    }
  }
  objc_msgSend(v10, "inspectableValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "valueType");

  objc_msgSend(v10, "inspectableValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 == 9)
  {
    objc_msgSend(v19, "dataAbsentReason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedPreferredName");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v22, "length"))
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_FAULT))
        +[HKInspectableValueCollection(Display) parseValueCollection:referenceRanges:healthRecordsStore:withCompletion:].cold.1(v23, v10);

      v22 = &stru_1E9C4C428;
    }
    v13[2](v13, 0, v22, &stru_1E9C4C428, 1);
  }
  else
  {
    objc_msgSend(v19, "ontologyConcept");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedPreferredName");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v22, "length"))
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB52D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_FAULT))
        +[HKInspectableValueCollection(Display) parseValueCollection:referenceRanges:healthRecordsStore:withCompletion:].cold.2(v25, v10);

      v22 = &stru_1E9C4C428;
    }
    v13[2](v13, 0, v22, &stru_1E9C4C428, 0);
  }

LABEL_4:
}

+ (void)parseUncodedValueCollection:()Display referenceRanges:withCompletion:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, void *, void *, _QWORD);

  v11 = a5;
  if (a3)
  {
    v7 = a3;
    objc_msgSend(v7, "valueInRangeWithReferenceRanges:includeUnitString:", a4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_trimWhitespaceAndNewlines");
    a3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB67D8], "_unitStringForValueCollection:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11[2](v11, v8, a3, v10, 0);

}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  objc_msgSend(a2, "inspectableValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataAbsentReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D7813000, v6, v7, "Data absent reasaon display name should not be nil: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_0_2();
}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:.cold.2(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  objc_msgSend(a2, "inspectableValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ontologyConcept");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1D7813000, v6, v7, "Concept display name should not be nil: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_0_2();
}

@end
