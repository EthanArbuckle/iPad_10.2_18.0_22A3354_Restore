@implementation HKNaturalScaleDistanceMeasurementFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (void)adjustedFormatInformationForUnit:(id)a3 number:(id)a4 displayType:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, double);
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  float v35;
  uint64_t v36;
  HKNaturalScaleDistanceMeasurementFormatter *v37;
  void (**v38)(id, id, double);
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[4];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id, double))a6;
  v13 = v10;
  objc_msgSend(a4, "doubleValue");
  v15 = v14;
  v16 = (float)(1.0
              / __exp10f((float)-[HKNaturalScaleDistanceMeasurementFormatter _precisionWithDisplayType:unit:andNumber:](self, "_precisionWithDisplayType:unit:andNumber:", v11, v13)));
  if (v15 <= 100.0 && v15 >= v16)
  {
    v17 = v13;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "_isMetricDistance"))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v20;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v20;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v21;
    objc_msgSend(MEMORY[0x1E0CB6CD0], "inchUnit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v37 = self;
  v38 = v12;
  if (v15 >= v16)
    objc_msgSend(v39, "objectEnumerator");
  else
    objc_msgSend(v39, "reverseObjectEnumerator");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
LABEL_12:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v27);
      if ((objc_msgSend(v28, "isEqual:", v13) & 1) != 0)
        break;
      if (objc_msgSend(v11, "displayTypeIdentifier") == 110
        || objc_msgSend(v11, "displayTypeIdentifier") != 110
        && (objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v28, "isEqual:", v29),
            v29,
            (v30 & 1) == 0))
      {
        objc_msgSend(v18, "addObject:", v28);
      }
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v25)
          goto LABEL_12;
        break;
      }
    }
  }

  if (!objc_msgSend(v18, "count"))
  {
    v31 = v15;
    v17 = v13;
    goto LABEL_32;
  }
  v17 = v13;
  v31 = v15;
  while (1)
  {
    v32 = v17;
    objc_msgSend(v18, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_valueByConvertingValue:toUnit:", v33, v31);
    v31 = v34;
    v17 = v33;

    objc_msgSend(v18, "removeLastObject");
    v35 = __exp10f((float)-[HKNaturalScaleDistanceMeasurementFormatter _precisionWithDisplayType:unit:andNumber:](v37, "_precisionWithDisplayType:unit:andNumber:", v11, v17, v31));
    if (v15 >= v16)
      break;
    if (v31 >= (float)(1.0 / v35))
      goto LABEL_31;
LABEL_28:
    v36 = objc_msgSend(v18, "count");

    if (!v36)
      goto LABEL_32;
  }
  if (v31 > 100.0)
    goto LABEL_28;
LABEL_31:

LABEL_32:
  v15 = v31;
  v12 = v38;
LABEL_33:
  v12[2](v12, v17, v15);

}

- (int64_t)_precisionWithDisplayType:(id)a3 unit:(id)a4 andNumber:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  int64_t v10;

  v7 = a4;
  objc_msgSend(a3, "chartingRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedDecimalPrecisionRuleForUnit:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "decimalPrecisionForValue:", a5);
  return v10;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11;
  v24 = __Block_byref_object_dispose__11;
  v25 = 0;
  objc_msgSend(v10, "unitForDisplayType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HKNaturalScaleDistanceMeasurementFormatter_stringFromNumber_displayType_unitController___block_invoke;
  v16[3] = &unk_1E9C42E48;
  v12 = v9;
  v17 = v12;
  v13 = v10;
  v18 = v13;
  v19 = &v20;
  -[HKNaturalScaleDistanceMeasurementFormatter adjustedFormatInformationForUnit:number:displayType:handler:](self, "adjustedFormatInformationForUnit:number:displayType:handler:", v11, v8, v12, v16);
  v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

void __90__HKNaturalScaleDistanceMeasurementFormatter_stringFromNumber_displayType_unitController___block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "_foundationUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "chartingRules");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowedDecimalPrecisionRuleForUnit:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "numberFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:displayType:unitController:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedDisplayNameForUnit:value:", v20, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("VALUE_UNIT_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v10, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

@end
