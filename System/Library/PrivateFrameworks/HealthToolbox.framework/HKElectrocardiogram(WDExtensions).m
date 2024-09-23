@implementation HKElectrocardiogram(WDExtensions)

- (id)wd_commaSeparatedHeaderWithActiveAlgorithmVersion:()WDExtensions
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  WDBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_CLASSIFICATION_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  objc_msgSend(v5, "appendString:", CFSTR(","));
  objc_msgSend(a1, "_localizedClassificationWithActiveAlgorithmVersion:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_24D38E7C8;
  objc_msgSend(v5, "appendString:", v11);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  WDBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_SYMPTOMS_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v14);

  objc_msgSend(v5, "appendString:", CFSTR(","));
  objc_msgSend(a1, "_localizedSymptoms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v16);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  WDBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_SOFTWARE_VERSION_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v19);

  objc_msgSend(v5, "appendString:", CFSTR(","));
  objc_msgSend(a1, "sourceRevision");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "version");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = &stru_24D38E7C8;
  objc_msgSend(v5, "appendString:", v23);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  objc_msgSend(a1, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hardwareVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    WDBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_DEVICE_VERSION_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v28);

    objc_msgSend(v5, "appendString:", CFSTR(","));
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hardwareVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("\"%@\"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v32);

    objc_msgSend(v5, "appendString:", CFSTR("\n"));
  }
  v33 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v33, "setUnitStyle:", 3);
  objc_msgSend(a1, "samplingFrequency");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_foundationMeasurement");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  WDBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_FREQUENCY_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v38);

  objc_msgSend(v5, "appendString:", CFSTR(","));
  if (v35)
  {
    objc_msgSend(v33, "stringFromMeasurement:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v39);

  }
  objc_msgSend(v5, "appendString:", CFSTR("\n"));

  return v5;
}

- (id)wd_commaSeparatedData
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v3, "setNumberStyle:", 1);
  v24 = v3;
  objc_msgSend(v3, "setUsesGroupingSeparator:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = a1;
  objc_msgSend(a1, "leadNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v22 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_msgSend(v2, "appendString:", CFSTR("\n"));
        v8 = objc_msgSend(v7, "integerValue");
        WDBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_LEAD_NAME_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v11);

        objc_msgSend(v2, "appendString:", CFSTR(","));
        if (v8 == 1)
        {
          WDBundle();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ECG_LEAD_NAME_I"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          HKConditionallyRedactedHeartRhythmString();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v2, "appendString:", v9);

        objc_msgSend(v2, "appendString:", CFSTR("\n"));
        WDBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_UNIT_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v16);

        objc_msgSend(v2, "appendString:", CFSTR(","));
        WDBundle();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ECG_CSV_UNIT_STRING"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HKConditionallyRedactedHeartRhythmString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v19);

        objc_msgSend(v2, "appendString:", CFSTR("\n"));
        objc_msgSend(v2, "appendString:", CFSTR("\n"));
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __58__HKElectrocardiogram_WDExtensions__wd_commaSeparatedData__block_invoke;
        v25[3] = &unk_24D38CDD8;
        v26 = v2;
        v27 = v24;
        objc_msgSend(v23, "_enumerateDataForLead:block:", v8, v25);

        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  return v2;
}

@end
