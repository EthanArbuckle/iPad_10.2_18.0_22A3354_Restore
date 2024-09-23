@implementation HKOverlayRoomPillValueProviderRelativeData

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  HKOverlayPillValue *v14;

  v10 = a7;
  v11 = a5;
  -[HKOverlayRoomPillValueProviderRelativeData _formattedValueFromChartPoints:displayType:unitPreferenceController:](self, "_formattedValueFromChartPoints:displayType:unitPreferenceController:", a3, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomPillValueProviderRelativeData _unitStringForValueString:displayType:unitPreferenceController:](self, "_unitStringForValueString:displayType:unitPreferenceController:", v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKOverlayPillValue initWithValueString:unitString:]([HKOverlayPillValue alloc], "initWithValueString:unitString:", v12, v13);
  return v14;
}

- (id)_formattedValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  BOOL v28;
  HKRelativeNumberFormatter *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = CFSTR("NO_DATA");
    v35 = CFSTR("HealthUI-Localizable");
LABEL_23:
    objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1E9C4C428, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v11)
  {

    goto LABEL_21;
  }
  v12 = v11;
  v37 = v8;
  v38 = v7;
  v13 = 0;
  v14 = *(_QWORD *)v40;
  v15 = 0.0;
  v16 = 0.0;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v40 != v14)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v18, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v18, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "relativeValueState");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22
          && (v23 = (void *)v22,
              objc_msgSend(v21, "relativeValueState"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              v25 = objc_msgSend(v24, "integerValue"),
              v24,
              v23,
              v25 != 3))
        {
          objc_msgSend(v21, "relativeValueState");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "integerValue") == 2;

          v13 |= v28;
        }
        else
        {
          objc_msgSend(v21, "value");
          v16 = v16 + v26 * (double)objc_msgSend(v21, "recordCount");
          v15 = v15 + (double)objc_msgSend(v21, "recordCount");
        }

      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v12);

  if (v15 <= 0.0)
  {
    v8 = v37;
    v7 = v38;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("ESTABLISHING_BASELINE");
LABEL_22:
      v35 = CFSTR("HealthUI-Localizable-Kali");
      goto LABEL_23;
    }
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = CFSTR("NOT_ENOUGH_DATA");
    goto LABEL_22;
  }
  v29 = objc_alloc_init(HKRelativeNumberFormatter);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 / v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v37;
  HKFormattedStringFromValue(v30, v37, v9, 0, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v38;
LABEL_24:

  return v31;
}

- (id)_unitStringForValueString:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &stru_1E9C4C428;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ESTABLISHING_BASELINE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v12) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOT_ENOUGH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(v9, "localizedDisplayNameForDisplayType:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@_DEGREES_FROM_BASELINE_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_4:
  }

  return v11;
}

@end
