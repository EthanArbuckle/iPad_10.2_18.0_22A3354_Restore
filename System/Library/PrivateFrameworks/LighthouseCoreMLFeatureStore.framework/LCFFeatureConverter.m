@implementation LCFFeatureConverter

+ (id)fromBiomeLabeledDataFeatureValue:(id)a3
{
  id v3;
  LCFFeatureValue *v4;
  void *v5;
  uint64_t v6;
  LCFFeatureValue *v7;
  LCFFeatureValue *v8;
  void *v9;
  void *v10;
  LCFFeatureValue *v11;
  LCFFeatureValue *v12;
  void *v14;
  LCFFeatureValue *v15;
  void *v16;
  LCFFeatureValue *v17;

  v3 = a3;
  if (objc_msgSend(v3, "hasIntValue"))
  {
    v4 = [LCFFeatureValue alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LCFFeatureValue initWithIntValue:](v4, "initWithIntValue:", v5);
  }
  else if (objc_msgSend(v3, "hasBoolValue"))
  {
    v7 = [LCFFeatureValue alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LCFFeatureValue initWithBoolValue:](v7, "initWithBoolValue:", v5);
  }
  else if (objc_msgSend(v3, "hasDoubleValue"))
  {
    v8 = [LCFFeatureValue alloc];
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v9, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[LCFFeatureValue initWithDoubleValue:](v8, "initWithDoubleValue:", v5);
  }
  else
  {
    objc_msgSend(v3, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [LCFFeatureValue alloc];
      objc_msgSend(v3, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LCFFeatureValue initWithStringValue:](v11, "initWithStringValue:", v5);
    }
    else
    {
      objc_msgSend(v3, "doubleValuedVectorValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = [LCFFeatureValue alloc];
        objc_msgSend(v3, "doubleValuedVectorValue");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "vectorWithDoubles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[LCFFeatureValue initWithDoubleArray:](v15, "initWithDoubleArray:", v16);

        goto LABEL_10;
      }
      if (!objc_msgSend(v3, "timeBucketValue"))
      {
        v12 = 0;
        goto LABEL_11;
      }
      v17 = [LCFFeatureValue alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "timeBucketValue"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LCFFeatureValue initWithTimeBucketValue:](v17, "initWithTimeBucketValue:", v5);
    }
  }
  v12 = (LCFFeatureValue *)v6;
LABEL_10:

LABEL_11:
  return v12;
}

+ (id)fromLabeledDataBiomeFeatureStore:(id)a3 timestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  LCFFeatureValue *v16;
  void *v17;
  LCFFeatureValue *v18;
  LCFFeatureValue *v19;
  void *v20;
  LCFFeatureValue *v21;
  LCFFeatureValue *v22;
  void *v23;
  LCFFeatureValue *v24;
  void *v25;
  LCFFeatureValue *v26;
  void *v27;
  LCFFeatureValue *v28;
  void *v29;
  LCFFeatureValue *v30;
  void *v31;
  LCFFeatureValue *v32;
  LCFFeatureSet *v33;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v37 = a4;
  objc_msgSend(v5, "itemIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "featureVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v5, "featureVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "featureName");
        BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "featureValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[LCFFeatureConverter fromBiomeLabeledDataFeatureValue:](LCFFeatureConverter, "fromBiomeLabeledDataFeatureValue:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setValue:forKey:", v15, v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "hasIsPositiveLabeled"))
  {
    v16 = [LCFFeatureValue alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isPositiveLabeled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[LCFFeatureValue initWithBoolValue:](v16, "initWithBoolValue:", v17);

    objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("_isPositiveLabeled"));
  }
  if (objc_msgSend(v5, "hasLabelingPolicyVersion"))
  {
    v19 = [LCFFeatureValue alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "labelingPolicyVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[LCFFeatureValue initWithIntValue:](v19, "initWithIntValue:", v20);

    objc_msgSend(v6, "setValue:forKey:", v21, CFSTR("_labelingPolicyVersion"));
  }
  v22 = [LCFFeatureValue alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "labelingEvidence"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[LCFFeatureValue initWithIntValue:](v22, "initWithIntValue:", v23);
  objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("_labelingEvidence"));

  objc_msgSend(v5, "sharingEventUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = [LCFFeatureValue alloc];
    objc_msgSend(v5, "sharingEventUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[LCFFeatureValue initWithStringValue:](v26, "initWithStringValue:", v27);

    objc_msgSend(v6, "setValue:forKey:", v28, CFSTR("_sharingEventUID"));
  }
  objc_msgSend(v5, "configurationInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = [LCFFeatureValue alloc];
    objc_msgSend(v5, "configurationInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[LCFFeatureValue initWithStringValue:](v30, "initWithStringValue:", v31);

    objc_msgSend(v6, "setValue:forKey:", v32, CFSTR("_configurationInfo"));
  }
  v33 = -[LCFFeatureSet initWithIdentifier:featureVersion:timestamp:featureValues:]([LCFFeatureSet alloc], "initWithIdentifier:featureVersion:timestamp:featureValues:", v36, v35, v37, v6);

  return v33;
}

+ (id)fromFeatureValueToLabeledData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend(v3, "intValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE0C4D0]);
    objc_msgSend(v3, "intValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = 0;
LABEL_5:
    v12 = 0;
LABEL_6:
    v13 = 0;
LABEL_7:
    v14 = (void *)objc_msgSend(v7, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", v8, v9, v12, v13, 0, 0);

    goto LABEL_8;
  }
  objc_msgSend(v3, "doubleValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BE0C4D0]);
    objc_msgSend(v3, "doubleValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = 0;
    v9 = v6;
    goto LABEL_5;
  }
  objc_msgSend(v3, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BE0C4D0]);
    objc_msgSend(v3, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    v8 = 0;
    v9 = 0;
    v12 = v6;
    goto LABEL_6;
  }
  objc_msgSend(v3, "BOOLValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BE0C4D0]);
    objc_msgSend(v3, "BOOLValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = 0;
    v9 = 0;
    v12 = 0;
    v13 = v6;
    goto LABEL_7;
  }
  objc_msgSend(v3, "doubleArray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x24BE0C4D0]);
    v22 = objc_alloc(MEMORY[0x24BE0C4D8]);
    objc_msgSend(v3, "doubleArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithVectorWithDoubles:", v23);
    v14 = (void *)objc_msgSend(v21, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", 0, 0, 0, 0, 0, v24);

  }
  else
  {
    objc_msgSend(v3, "timeBucketValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "timeBucketValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "intValue");

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C4D0]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", 0, 0, 0, 0, v26, 0);
    }
  }
LABEL_8:

  return v14;
}

+ (id)fromFeatureSetToLabeledData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "itemIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureVersion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v3, "featureValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = v6;
    v39 = 0;
    v40 = 0;
    v38 = 0;
    v37 = 0;
    v41 = 0;
    v8 = *(_QWORD *)v45;
    v9 = CFSTR("_isPositiveLabeled");
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v12 = BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString();
        if ((_DWORD)v12)
        {
          v13 = v12;
          objc_msgSend(v3, "featureValues");
          v14 = v9;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[LCFFeatureConverter fromFeatureValueToLabeledData:](LCFFeatureConverter, "fromFeatureValueToLabeledData:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v14;
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C4C8]), "initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:", v13, v17, 0, 0, 0, 0);
          objc_msgSend(v43, "addObject:", v18);
LABEL_18:

          continue;
        }
        if (objc_msgSend(v11, "isEqualToString:", v9))
        {
          objc_msgSend(v3, "featureValues");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "BOOLValue");
          v21 = objc_claimAutoreleasedReturnValue();

          v41 = (void *)v21;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("_labelingPolicyVersion")))
        {
          objc_msgSend(v3, "featureValues");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("_labelingPolicyVersion"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "intValue");
          v24 = objc_claimAutoreleasedReturnValue();

          v39 = (void *)v24;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("_labelingEvidence")))
        {
          objc_msgSend(v3, "featureValues");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("_labelingEvidence"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "intValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v27, "intValue");

        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("_sharingEventUID")))
        {
          objc_msgSend(v3, "featureValues");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("_sharingEventUID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringValue");
          v30 = objc_claimAutoreleasedReturnValue();

          v38 = (void *)v30;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("_configurationInfo")))
        {
          objc_msgSend(v3, "featureValues");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("_configurationInfo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringValue");
          v31 = objc_claimAutoreleasedReturnValue();

          v40 = (void *)v31;
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (!v7)
        goto LABEL_23;
    }
  }
  v39 = 0;
  v40 = 0;
  v38 = 0;
  v37 = 0;
  v41 = 0;
LABEL_23:

  LODWORD(v34) = v37;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C4C0]), "initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:isPositiveLabeled:labelingPolicyVersion:labelingEvidence:sharingEventUID:configurationInfo:", v36, v35, v43, 0, v41, v39, v34, v38, v40);

  return v32;
}

@end
