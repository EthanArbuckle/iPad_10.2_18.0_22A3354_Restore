@implementation HKInspectableValue(Display)

- (__CFString)displayString
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = &stru_1E9C4C428;
  switch(objc_msgSend(a1, "valueType"))
  {
    case 0:
      objc_msgSend(a1, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v3;
    case 1:
      objc_msgSend(a1, "ratioValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      objc_msgSend(a1, "ratioValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "denominator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_joinValueStrings:", v10);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 2:
      objc_msgSend(a1, "medicalDateValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(a1, "_stringForMedicalDateInterval");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v3;
    case 4:
      objc_msgSend(a1, "_stringForTimeSinceMidnight");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (__CFString *)v3;
    case 6:
      objc_msgSend(a1, "codedQuantityValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = v11;
      objc_msgSend(v11, "displayString");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7:
      objc_msgSend(a1, "medicalCodings");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8:
      objc_msgSend(a1, "codedValueCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_displayStringForCodedValueCollection:", v4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9:
      objc_msgSend(a1, "dataAbsentReasonCodings");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v4 = (void *)v15;
      objc_msgSend(a1, "_stringForMedicalCodings:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v2 = (__CFString *)v16;
LABEL_15:

      return v2;
    case 10:
      objc_msgSend(a1, "inspectableIntegerValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v2 = (__CFString *)v14;
      goto LABEL_22;
    case 11:
      objc_msgSend(a1, "BOOLeanValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "BOOLValue");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)_stringForMedicalCodings:()Display
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "medicalCodings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "codingSystem", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6838], "textSystem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (v16)
        {
          objc_msgSend(v13, "displayString");
          v17 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v17;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_stringForMedicalDateInterval
{
  void *v1;
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "medicalDateIntervalValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E9C4C428;
  }
  objc_msgSend(v1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v1, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E9C4C428;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_stringForTimeSinceMidnight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateComponentsValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HKLocalizedStringForDateAndTemplate(v4, 27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringForQuantity:()Display
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "_unit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v7, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)_joinValueStrings:()Display
{
  return objc_msgSend(a3, "componentsJoinedByString:", CFSTR("/"));
}

- (id)_displayStringForCodedValueCollection:()Display
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "codedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v4, "codedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  v32 = a1;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unitString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v13) = objc_msgSend(v14, "isEqualToString:", v34);
        if (!(_DWORD)v13)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = v4;
  objc_msgSend(v4, "codedValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    do
    {
      v20 = 0;
      v35 = v18;
      do
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v20);
        objc_msgSend(v21, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "displayString");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if ((v15 & 1) != 0)
        {
          objc_msgSend(v16, "addObject:", v23);

        }
        else
        {
          v45[0] = v23;
          objc_msgSend(v21, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "unitString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v45[1] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
          v27 = v15;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "componentsJoinedByString:", CFSTR(" "));
          v29 = objc_claimAutoreleasedReturnValue();

          v15 = v27;
          objc_msgSend(v16, "addObject:", v29);
          v22 = (void *)v29;
          v18 = v35;
        }

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v18);
  }

  objc_msgSend(v32, "_joinValueStrings:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

@end
