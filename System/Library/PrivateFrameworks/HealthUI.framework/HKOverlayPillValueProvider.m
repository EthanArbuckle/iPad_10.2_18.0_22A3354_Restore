@implementation HKOverlayPillValueProvider

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HKOverlayPillValue *v15;

  v11 = a5;
  -[HKOverlayPillValueProvider _quantityRangeFromChartPoints:unit:displayType:unitPreferenceController:](self, "_quantityRangeFromChartPoints:unit:displayType:unitPreferenceController:", a3, a4, v11, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayPillValueProvider _valueFromQuantityRange:displayType:](self, "_valueFromQuantityRange:displayType:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayPillValueProvider _unitFromQuantityRange:displayType:](self, "_unitFromQuantityRange:displayType:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKOverlayPillValue initWithValueString:unitString:]([HKOverlayPillValue alloc], "initWithValueString:unitString:", v13, v14);
  return v15;
}

- (id)_valueFromQuantityRange:(id)a3 displayType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "minimum");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "maximum");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
      -[HKOverlayPillValueProvider _formattedQuantityRange:displayType:](self, "_formattedQuantityRange:displayType:", v6, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v6, "maximum");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayPillValueProvider _formattedQuantity:displayType:](self, "_formattedQuantity:displayType:", v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

LABEL_7:
  return v13;
}

- (id)_unitFromQuantityRange:(id)a3 displayType:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;

  if (a3)
  {
    v5 = a3;
    objc_msgSend(a4, "objectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unitStringForType:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E9C4C428;
  }
  return v7;
}

- (id)_quantityRangeFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    v27 = 0;
    goto LABEL_24;
  }
  v33 = v12;
  v34 = v11;
  v35 = v10;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v14)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_20;
  }
  v15 = v14;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v37 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      if (!v17
        || (objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "minYValue"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "compare:", v17),
            v21,
            v22 == -1))
      {
        objc_msgSend(v20, "minYValue");
        v23 = objc_claimAutoreleasedReturnValue();

        v17 = v23;
        if (v16)
        {
LABEL_13:
          objc_msgSend(v20, "maxYValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "compare:", v16);

          if (v25 != 1)
            continue;
        }
      }
      else if (v16)
      {
        goto LABEL_13;
      }
      objc_msgSend(v20, "maxYValue");
      v26 = objc_claimAutoreleasedReturnValue();

      v16 = v26;
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v15);
LABEL_20:

  if (v17 | v16)
  {
    v28 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend((id)v17, "doubleValue");
    objc_msgSend(v28, "quantityWithUnit:doubleValue:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB6A28];
    v10 = v35;
    objc_msgSend((id)v16, "doubleValue");
    objc_msgSend(v30, "quantityWithUnit:doubleValue:", v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A38]), "initWithMinimum:maximum:isMinimumInclusive:isMaximumInclusive:", v29, v31, 1, 1);

  }
  else
  {
    v27 = 0;
    v10 = v35;
  }
  v12 = v33;

  v11 = v34;
LABEL_24:

  return v27;
}

- (id)_formattedQuantity:(id)a3 displayType:(id)a4
{
  id v5;
  id v6;
  HKQuantityFormattingParameters *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKQuantityFormattingParameters);
  -[HKQuantityFormattingParameters setOmitUnit:](v7, "setOmitUnit:", 1);
  objc_msgSend(v5, "objectType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForType:parameters:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_formattedQuantityRange:(id)a3 displayType:(id)a4
{
  id v5;
  id v6;
  HKQuantityFormattingParameters *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKQuantityFormattingParameters);
  -[HKQuantityFormattingParameters setOmitUnit:](v7, "setOmitUnit:", 1);
  objc_msgSend(v5, "objectType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForType:parameters:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
