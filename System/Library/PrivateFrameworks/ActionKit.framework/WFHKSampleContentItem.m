@implementation WFHKSampleContentItem

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  WFConcreteStatisticsSampleProvider *v29;
  WFConcreteStatisticsSampleProvider *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, _QWORD))a3;
  if ((Class)objc_opt_class() == a5)
  {
    v8 = (void *)objc_opt_new();
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isEqualToDate:", v12))
    {
      v13 = (void *)MEMORY[0x24BE19590];
      v14 = CFSTR("Sample Date");
      v15 = v10;
    }
    else
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BE19590], "object:named:", v10, CFSTR("Sample Start Date"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v20);

      }
      if (!v12)
        goto LABEL_14;
      v13 = (void *)MEMORY[0x24BE19590];
      v14 = CFSTR("Sample End Date");
      v15 = v12;
    }
    objc_msgSend(v13, "object:named:", v15, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v21);

LABEL_14:
    v22 = (void *)objc_msgSend(v8, "copy");
    v7[2](v7, v22, 0);

    goto LABEL_16;
  }
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() != a5)
    {
      if ((Class)objc_opt_class() == a5)
      {
        v28 = (void *)MEMORY[0x24BE19590];
        v29 = [WFConcreteStatisticsSampleProvider alloc];
        -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[WFConcreteStatisticsSampleProvider initWithSampleProvider:](v29, "initWithSampleProvider:", v8);
        -[WFHKSampleContentItem name](self, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "object:named:", v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v33, 0);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v8);
      }
      goto LABEL_17;
    }
    v23 = (void *)MEMORY[0x24BE19590];
    v24 = (void *)MEMORY[0x24BDD16E0];
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quantity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKSampleContentItem unit](self, "unit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wf_normalizedDoubleValueForUnit:", v12);
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "object:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v27, 0);

LABEL_16:
LABEL_17:

    goto LABEL_18;
  }
  v16 = (void *)MEMORY[0x24BE19590];
  -[WFHKSampleContentItem sampleValue](self, "sampleValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "object:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v19, 0);

LABEL_18:
}

- (id)quantitySampleContainer
{
  return (id)-[WFHKSampleContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)quantitySample
{
  void *v2;
  void *v3;

  -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)readableTypeIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantityType");
  }
  else
  {
    -[WFHKSampleContentItem categorySample](self, "categorySample");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryType");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sampleValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WFHKSampleContentItem localizedCategorySampleValue](self, "localizedCategorySampleValue");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  -[WFHKSampleContentItem unit](self, "unit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_7:
    v11 = &stru_24F8BBA48;
    return v11;
  }
  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKSampleContentItem unit](self, "unit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_normalizedDoubleValueForUnit:", v9);
  objc_msgSend(v7, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedCategorySampleValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  __CFString *v34;

  -[WFHKSampleContentItem categorySample](self, "categorySample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2858]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    +[WFHealthKitHelper readableAppleStandingHourFromEnum:](WFHealthKitHelper, "readableAppleStandingHourFromEnum:", objc_msgSend(v2, "value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v2, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2890]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    +[WFHealthKitHelper readableCervicalMucusQualityFromEnum:](WFHealthKitHelper, "readableCervicalMucusQualityFromEnum:", objc_msgSend(v2, "value"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  objc_msgSend(v2, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2998]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    +[WFHealthKitHelper readableMenstrualFlowFromEnum:](WFHealthKitHelper, "readableMenstrualFlowFromEnum:", objc_msgSend(v2, "value"));
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(v2, "categoryType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29C0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
    +[WFHealthKitHelper readableOvulationTestResultFromEnum:](WFHealthKitHelper, "readableOvulationTestResultFromEnum:", objc_msgSend(v2, "value"));
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v14;
  }
  objc_msgSend(v2, "categoryType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v16)
  {
    +[WFHealthKitHelper readableSleepAnalysisFromEnum:](WFHealthKitHelper, "readableSleepAnalysisFromEnum:", objc_msgSend(v2, "value"));
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend(v2, "categoryType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A08]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 == v18)
  {
    objc_msgSend(v2, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BDD31F8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      +[WFHealthKitHelper readableSexualActivityFromBool:](WFHealthKitHelper, "readableSexualActivityFromBool:", objc_msgSend(v20, "BOOLValue"));
    else
      WFLocalizedString(CFSTR("Unspecified"));
    v22 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v22;
  }
  objc_msgSend(v2, "categoryType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2850]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 == v24)
  {
    +[WFHealthKitHelper readableAppetiteChangesValueFromEnum:](WFHealthKitHelper, "readableAppetiteChangesValueFromEnum:", objc_msgSend(v2, "value"));
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend(v2, "categoryType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD29A8]);
  v26 = objc_claimAutoreleasedReturnValue();
  if (v25 == (void *)v26)
  {

    goto LABEL_24;
  }
  v27 = (void *)v26;
  objc_msgSend(v2, "categoryType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A38]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28 == v29)
  {
LABEL_24:
    +[WFHealthKitHelper readablePresenceValueFromEnum:](WFHealthKitHelper, "readablePresenceValueFromEnum:", objc_msgSend(v2, "value"));
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  WFHealthKitSymptomsTypeIdentifiers();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v30, "containsObject:", v32);

  if (v33)
  {
    +[WFHealthKitHelper readableSeverityValueFromEnum:](WFHealthKitHelper, "readableSeverityValueFromEnum:", objc_msgSend(v2, "value"));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      v34 = &stru_24F8BBA48;
      goto LABEL_26;
    }
    WFLocalizedParameterValue(v5);
    v21 = objc_claimAutoreleasedReturnValue();
  }
LABEL_25:
  v34 = (__CFString *)v21;

LABEL_26:
  return v34;
}

- (id)unit
{
  void *v2;
  void *v3;

  -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)categorySample
{
  return (id)-[WFHKSampleContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)startDate
{
  void *v3;
  void *v4;
  void *v5;

  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  else
    -[WFHKSampleContentItem categorySample](self, "categorySample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endDate
{
  void *v3;
  void *v4;
  void *v5;

  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  else
    -[WFHKSampleContentItem categorySample](self, "categorySample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[WFHKSampleContentItem endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKSampleContentItem startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE19630]), "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", 224, 0, 1, v6);
}

- (id)sourceName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = (void (**)(id, void *, _QWORD))a3;
  -[WFHKSampleContentItem quantitySample](self, "quantitySample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quantityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[WFHKSampleContentItem categorySample](self, "categorySample");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "categoryType");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v11 = (void *)getHKDisplayTypeControllerClass_softClass_10748;
  v29 = getHKDisplayTypeControllerClass_softClass_10748;
  if (!getHKDisplayTypeControllerClass_softClass_10748)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __getHKDisplayTypeControllerClass_block_invoke_10749;
    v25[3] = &unk_24F8BB430;
    v25[4] = &v26;
    __getHKDisplayTypeControllerClass_block_invoke_10749((uint64_t)v25);
    v11 = (void *)v27[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sharedInstanceForHealthStore:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x24BEC1398]);
  objc_msgSend(v15, "displayCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithPlatformColor:", v18);

  v20 = objc_alloc(MEMORY[0x24BEC14E0]);
  objc_msgSend(v15, "listIcon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithPlatformImage:", v21);
  objc_msgSend(v22, "imageWithTintColor:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v5[2](v5, v23, 0);

  return v23 != 0;
}

- (BOOL)getListAltText:(id)a3
{
  objc_class *v4;
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1500];
    v5 = (void (**)(id, void *))a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(v6, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(v6, "setDateStyle:", 1);
    objc_msgSend(v6, "setTimeStyle:", 1);
    -[WFHKSampleContentItem quantitySample](self, "quantitySample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9);

  }
  return 1;
}

- (unint64_t)preferredDisplayStyle
{
  return 2;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WFHKSampleContentItem unit](self, "unit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFHKSampleContentItem quantitySampleContainer](self, "quantitySampleContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "hasSubsamples");
LABEL_9:

      goto LABEL_10;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WFHKSampleContentItem;
  v7 = -[WFHKSampleContentItem canGenerateRepresentationForType:](&v10, sel_canGenerateRepresentationForType_, v4);
LABEL_10:

  return v7;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC16D0]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE19428];
  -[WFHKSampleContentItem cachingIdentifier](self, "cachingIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v7, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)itemWithQuantitySample:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithQuantitySample:unit:", a3, 0);
}

+ (id)itemWithQuantitySample:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  WFHKQuantitySampleContainer *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[WFHKQuantitySampleContainer initWithSample:unit:]([WFHKQuantitySampleContainer alloc], "initWithSample:unit:", v6, v5);

  +[WFContentItem itemWithObject:](WFHKSampleContentItem, "itemWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)itemWithQuantitySamples:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithQuantitySamples:unit:", a3, 0);
}

+ (id)itemWithQuantitySamples:(id)a3 unit:(id)a4
{
  id v5;
  id v6;
  WFHKQuantitySampleContainer *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[WFHKQuantitySampleContainer initWithSubsamples:unit:]([WFHKQuantitySampleContainer alloc], "initWithSubsamples:unit:", v6, v5);

  +[WFContentItem itemWithObject:](WFHKSampleContentItem, "itemWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[9];

  v37[7] = *MEMORY[0x24BDAC8D0];
  +[WFHealthKitHelper localizedSampleTypes](WFHealthKitHelper, "localizedSampleTypes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Type"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("readableTypeIdentifier"), v36, objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "primary:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "possibleValues:", v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortable:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "filterable:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v30;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Value"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("sampleValue"), v29, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v28;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Unit"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("unit.unitString"), v27, objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sortable:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filterable:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v24;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Start Date"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("startDate"), v23, objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tense:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "comparableUnits:", 8220);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v6;
  v7 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("End Date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("endDate"), v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "comparableUnits:", 8220);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v10;
  v11 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPath:name:class:", CFSTR("duration"), v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeUnits:", 224);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v14;
  v15 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Source"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyPath:name:class:", CFSTR("sourceName"), v16, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "possibleValues:", MEMORY[0x24BDBD1A8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 7);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;
  _QWORD block[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    +[WFHealthKitHelper extractHKDataFromContentQuery:](WFHealthKitHelper, "extractHKDataFromContentQuery:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v14, "endDate");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v14, "sampleType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
          aBlock[3] = &unk_24F8B2168;
          v20 = v14;
          v37 = v20;
          v40 = v13;
          v38 = v10;
          v39 = v12;
          v41 = a1;
          v21 = _Block_copy(aBlock);
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x3032000000;
          v34[3] = __Block_byref_object_copy__10794;
          v34[4] = __Block_byref_object_dispose__10795;
          v35 = 0;
          v22 = dispatch_group_create();
          objc_msgSend(v20, "sourceName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            dispatch_group_enter(v22);
            objc_msgSend(v20, "sourceName");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sampleType");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_336;
            v31[3] = &unk_24F8B2190;
            v33 = v34;
            v32 = v22;
            +[WFHealthKitHelper sourcesWithName:ofSampleType:completion:](WFHealthKitHelper, "sourcesWithName:ofSampleType:completion:", v24, v25, v31);

          }
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2_338;
          block[3] = &unk_24F8BB590;
          v29 = v21;
          v30 = v34;
          v26 = v21;
          dispatch_group_notify(v22, MEMORY[0x24BDAC9B8], block);

          _Block_object_dispose(v34, 8);
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    if (v13)
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
    goto LABEL_12;
  }
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
  objc_msgSendSuper2(&v27, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
LABEL_13:

}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Health sample"), CFSTR("Health sample"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Health samples"), CFSTR("Health samples"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Health samples"));
}

+ (id)localizedFilterDescription
{
  return WFLocalizedString(CFSTR("Health Sample"));
}

+ (id)localizedPluralFilterDescription
{
  return WFLocalizedString(CFSTR("Health Samples"));
}

+ (BOOL)hasLibrary
{
  return 1;
}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = (void *)MEMORY[0x24BDD3E88];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForSamplesWithStartDate:endDate:options:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0x24BDD1000;
  if (v3)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x24BDD3E88], "predicateForObjectsFromSource:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v14);
    }

    v10 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

  }
  v19 = *(void **)(v10 + 1216);
  v20 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc(MEMORY[0x24BDD3F00]);
  objc_msgSend(*(id *)(a1 + 32), "sampleType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2;
  v28[3] = &unk_24F8B2140;
  v32 = *(id *)(a1 + 56);
  v29 = *(id *)(a1 + 32);
  v30 = *(id *)(a1 + 40);
  v24 = *(id *)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 64);
  v31 = v24;
  v33 = v25;
  v26 = (void *)objc_msgSend(v22, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v23, v21, 0, 0, v28);

  objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "executeQuery:", v26);

}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_336(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2_338(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "quantityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_3;
      v15[3] = &unk_24F8B20D8;
      v16 = *(id *)(a1 + 40);
      objc_msgSend(v6, "if_map:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "if_map:", &__block_literal_global_10801);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v14.receiver = *(id *)(a1 + 64);
    v14.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
    objc_msgSendSuper2(&v14, sel_runQuery_withItems_permissionRequestor_completionHandler_, v11, v9, v12, v13);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v7);
  }

}

id __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFHKSampleContentItemQueryUnit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHKSampleContentItem itemWithQuantitySample:unit:](WFHKSampleContentItem, "itemWithQuantitySample:unit:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

WFHKSampleContentItem *__82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:](WFHKSampleContentItem, "itemWithObject:", a2);
}

@end
