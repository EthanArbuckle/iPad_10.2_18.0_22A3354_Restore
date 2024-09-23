@implementation HDFeatureStatusDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("HealthFeatureStatus.txt");
}

- (void)run
{
  -[HDFeatureStatusDiagnosticOperation _reportRequirementSatisfactionOverridesByFeature](self, "_reportRequirementSatisfactionOverridesByFeature");
  -[HDFeatureStatusDiagnosticOperation _reportFeatureStatusByFeature](self, "_reportFeatureStatusByFeature");
  -[HDFeatureStatusDiagnosticOperation _reportRegionAvailabilityByFeature](self, "_reportRegionAvailabilityByFeature");
}

- (void)_reportRequirementSatisfactionOverridesByFeature
{
  HDFeatureStatusDiagnosticOperation *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  HDFeatureStatusDiagnosticOperation *v25;
  uint64_t v26;
  id obj;
  id v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v2 = self;
  v43 = *MEMORY[0x24BDAC8D0];
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Requirement Satisfaction Overrides"));
  -[HDDiagnosticOperation appendStrongSeparator](v2, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](v2, "appendNewline");
  HKAllFeatureIdentifiers();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v3)
    goto LABEL_23;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v38;
  v24 = *(_QWORD *)v38;
  v25 = v2;
  do
  {
    v7 = 0;
    v26 = v4;
    do
    {
      if (*(_QWORD *)v38 != v6)
        objc_enumerationMutation(obj);
      v8 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v7);
      if ((HKFeatureIdentifierIsProvidedBySleepDaemon() & 1) == 0)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BC0]), "initWithFeatureIdentifier:", v8);
        objc_msgSend(v9, "overriddenRequirementIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v30 = v7;
          -[HDDiagnosticOperation appendString:](v2, "appendString:", v8);
          -[HDDiagnosticOperation appendSeparator](v2, "appendSeparator");
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4028]), "initWithColumnTitles:", 0);
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __86__HDFeatureStatusDiagnosticOperation__reportRequirementSatisfactionOverridesByFeature__block_invoke;
          v35[3] = &unk_24E0D8A28;
          v28 = v11;
          v36 = v28;
          v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22078C350](v35);
          v29 = v10;
          objc_msgSend(v10, "allObjects");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v32 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v9, "overriddenSatisfactionOfRequirementWithIdentifier:", v20, v24);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v21, "BOOLValue"))
                  v22 = CFSTR("YES");
                else
                  v22 = CFSTR("NO");
                ((void (**)(_QWORD, uint64_t, const __CFString *))v12)[2](v12, v20, v22);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
            }
            while (v17);
          }

          objc_msgSend(v28, "formattedTable");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v25;
          -[HDDiagnosticOperation appendString:](v25, "appendString:", v23);

          -[HDDiagnosticOperation appendNewline](v25, "appendNewline");
          v5 = 1;
          v6 = v24;
          v4 = v26;
          v10 = v29;
          v7 = v30;
        }

      }
      ++v7;
    }
    while (v7 != v4);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  }
  while (v4);
  if ((v5 & 1) == 0)
  {
LABEL_23:
    -[HDDiagnosticOperation appendString:](v2, "appendString:", CFSTR("<none>"), v24);
    -[HDDiagnosticOperation appendNewline](v2, "appendNewline");
  }

}

void __86__HDFeatureStatusDiagnosticOperation__reportRequirementSatisfactionOverridesByFeature__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:"), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendRow:", v8);

}

- (void)_reportFeatureStatusByFeature
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Feature Status"));
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  HKAllFeatureIdentifiers();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HDFeatureStatusDiagnosticOperation _reportFeatureStatusForFeature:healthStore:](self, "_reportFeatureStatusForFeature:healthStore:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), v3);
        -[HDDiagnosticOperation appendNewline](self, "appendNewline");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_reportFeatureStatusForFeature:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HDDiagnosticOperation appendString:](self, "appendString:", v6);
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD2DC8]))
  {
    -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("<redacted>"));
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BF8]), "initWithFeatureIdentifier:healthStore:countryCodeSource:", v6, v7, 0);
    v14 = 0;
    objc_msgSend(v8, "featureStatusWithError:", &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    if (v9)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BC0]), "initWithFeatureIdentifier:", v6);
      HKPrettyPrintedFeatureStatus();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDiagnosticOperation appendString:](self, "appendString:", v13);

    }
    else
    {
      -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Error evaluating feature status for %@: %@"), v6, v10);
      -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    }

  }
}

- (void)_reportRegionAvailabilityByFeature
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HDDiagnosticOperation appendString:](self, "appendString:", CFSTR("Region Availability"));
  -[HDDiagnosticOperation appendStrongSeparator](self, "appendStrongSeparator");
  -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  HKAllFeatureIdentifiers();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HDFeatureStatusDiagnosticOperation _reportRegionAvailabilityForFeature:healthStore:](self, "_reportRegionAvailabilityForFeature:healthStore:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), v3);
        -[HDDiagnosticOperation appendNewline](self, "appendNewline");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_reportRegionAvailabilityForFeature:(id)a3 healthStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HDDiagnosticOperation appendString:](self, "appendString:", v6);
  -[HDDiagnosticOperation appendSeparator](self, "appendSeparator");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BE0]), "initWithFeatureIdentifier:healthStore:", v6, v7);

  v13 = 0;
  objc_msgSend(v8, "regionAvailabilityWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "prettyPrintedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDiagnosticOperation appendString:](self, "appendString:", v12);

  }
  else
  {
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("Error evaluating region availability for %@: %@"), v6, v10);
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
  }

}

@end
