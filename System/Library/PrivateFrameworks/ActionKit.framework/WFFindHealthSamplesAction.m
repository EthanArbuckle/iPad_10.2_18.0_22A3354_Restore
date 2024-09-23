@implementation WFFindHealthSamplesAction

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFindHealthSamplesAction;
  -[WFContentItemFilterAction initializeParameters](&v7, sel_initializeParameters);
  -[WFFindHealthSamplesAction configurationData](self, "configurationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringUnit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuantityType:", v5);

  objc_msgSend(v3, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFindHealthSamplesAction updateSourcesForSampleType:](self, "updateSourcesForSampleType:", v6);

  -[WFFindHealthSamplesAction updateParameterVisibility](self, "updateParameterVisibility");
}

- (id)disallowedVariableTypesForTableTemplate
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEC4780];
  v4[0] = *MEMORY[0x24BEC4758];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generatedResourceNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString **v11;
  __CFString *v12;
  WFHealthKitAccessResource *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFHealthKitAccessResource *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  objc_super v26;
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)WFFindHealthSamplesAction;
  -[WFFindHealthSamplesAction generatedResourceNodes](&v26, sel_generatedResourceNodes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFFindHealthSamplesAction valueForKeyPath:](self, "valueForKeyPath:", CFSTR("readableSampleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
      v10 = (void *)v7;
    else
      v10 = (void *)v8;
    if (v7)
      v11 = WFHKReadableObjectTypeQuantity;
    else
      v11 = WFHKReadableObjectTypeCategory;
    v25 = v10;
    v12 = *v11;
    v13 = [WFHealthKitAccessResource alloc];
    v27[0] = *MEMORY[0x24BEC4630];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = CFSTR("Read");
    v27[1] = CFSTR("AccessType");
    v27[2] = CFSTR("ReadableType");
    v27[3] = CFSTR("ObjectType");
    v28[2] = v12;
    v28[3] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v16 = v5;
    v17 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFHealthKitAccessResource initWithDefinition:](v13, "initWithDefinition:", v18);
    v29[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v17;
    v5 = v16;

    objc_msgSend(v20, "if_map:", &__block_literal_global_44151);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v21);
    v22 = v4;

    v23 = v25;
  }
  else
  {
    v23 = 0;
    v12 = 0;
    v22 = (id)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFindHealthSamplesAction;
  -[WFContentItemFilterAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFFindHealthSamplesAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFFindHealthSamplesAction;
  -[WFContentItemFilterAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFFindHealthSamplesAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (NSString)readableSampleType
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContentItemFilterAction rowForContentPropertyName:](self, "rowForContentPropertyName:", CFSTR("Type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerationValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)configurationData
{
  void *v2;
  void *v3;
  WFHKContentQueryData *v4;
  void *v5;
  void *v6;

  -[WFFindHealthSamplesAction readableSampleType](self, "readableSampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v4 = objc_alloc_init(WFHKContentQueryData);
    goto LABEL_5;
  }
  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(WFHKContentQueryData);
  if (!v3)
  {
LABEL_5:
    -[WFHKContentQueryData setQuantityType:](v4, "setQuantityType:", 0);
    -[WFHKContentQueryData setCategoryType:](v4, "setCategoryType:", 0);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD3F08], "quantityTypeForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKContentQueryData setQuantityType:](v4, "setQuantityType:", v5);

  objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKContentQueryData setCategoryType:](v4, "setCategoryType:", v6);

LABEL_6:
  return v4;
}

- (void)resourceAvailabilityChanged
{
  void *v3;
  void *v4;
  id v5;

  -[WFFindHealthSamplesAction configurationData](self, "configurationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringUnit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePossibleStates");
  objc_msgSend(v5, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFindHealthSamplesAction updateSourcesForSampleType:](self, "updateSourcesForSampleType:", v4);

}

- (id)parameterDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[3];
  _QWORD v50[3];
  void *v51;
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[7];
  _QWORD v55[7];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  _QWORD v62[7];
  _QWORD v63[9];

  v63[7] = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)WFFindHealthSamplesAction;
  -[WFContentItemFilterAction parameterDefinitions](&v48, sel_parameterDefinitions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v2, "mutableCopy");

  v63[0] = CFSTR("Minute");
  v63[1] = CFSTR("Hour");
  v63[2] = CFSTR("Day");
  v63[3] = CFSTR("Week");
  v63[4] = CFSTR("Month");
  v63[5] = CFSTR("3 Months");
  v63[6] = CFSTR("Year");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 7);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("Minute (WFHKSampleFilteringGroupBy)"), CFSTR("Minute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v3;
  WFLocalizedStringResourceWithKey(CFSTR("Hour (WFHKSampleFilteringGroupBy)"), CFSTR("Hour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v4;
  WFLocalizedStringResourceWithKey(CFSTR("Day (WFHKSampleFilteringGroupBy)"), CFSTR("Day"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v5;
  WFLocalizedStringResourceWithKey(CFSTR("Week (WFHKSampleFilteringGroupBy)"), CFSTR("Week"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v6;
  WFLocalizedStringResourceWithKey(CFSTR("Month (WFHKSampleFilteringGroupBy)"), CFSTR("Month"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v7;
  WFLocalizedStringResourceWithKey(CFSTR("3 Months (WFHKSampleFilteringGroupBy)"), CFSTR("3 Months"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v8;
  WFLocalizedStringResourceWithKey(CFSTR("Year (WFHKSampleFilteringGroupBy)"), CFSTR("Year"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BEC3F38]);
  v56 = *MEMORY[0x24BEC4510];
  v44 = v56;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v12;
  v57 = *MEMORY[0x24BEC4598];
  v13 = v57;
  WFLocalizedStringResourceWithKey(CFSTR("Unit (WFHKSampleFilteringUnit)"), CFSTR("Unit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v14;
  v58 = *MEMORY[0x24BEC4520];
  v42 = v58;
  WFLocalizedStringResourceWithKey(CFSTR("The unit to use for the returned results"), CFSTR("The unit to use for the returned results"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BEC4588];
  v61[2] = v15;
  v61[3] = CFSTR("WFHKSampleFilteringUnit");
  v17 = *MEMORY[0x24BEC45B8];
  v59 = v16;
  v60 = v17;
  v43 = v16;
  WFLocalizedStringResourceWithKey(CFSTR("None"), CFSTR("None"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v61[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v56, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v10, "initWithDictionary:", v19);
  objc_msgSend(v45, "insertObject:atIndex:", v20, 1);

  v21 = objc_alloc(MEMORY[0x24BEC3F38]);
  v54[0] = v44;
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v23;
  v54[1] = v13;
  WFLocalizedStringResourceWithKey(CFSTR("Group by (WFHKSampleFilteringGroupBy)"), CFSTR("Group by"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v24;
  v54[2] = v42;
  WFLocalizedStringResourceWithKey(CFSTR("The time period to group results by. For example, grouping by day gives you only the daily totals."), CFSTR("The time period to group results by. For example, grouping by day gives you only the daily totals."));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v25;
  v55[3] = CFSTR("WFHKSampleFilteringGroupBy");
  v54[3] = v16;
  v54[4] = v17;
  WFLocalizedStringResourceWithKey(CFSTR("None"), CFSTR("None"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BEC4550];
  v55[4] = v26;
  v55[5] = v46;
  v28 = *MEMORY[0x24BEC4548];
  v54[5] = v27;
  v54[6] = v28;
  v55[6] = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v21, "initWithDictionary:", v29);
  objc_msgSend(v45, "insertObject:atIndex:", v30, 2);

  v31 = objc_alloc(MEMORY[0x24BEC3F38]);
  v52[0] = v44;
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v33;
  v52[1] = v13;
  WFLocalizedStringResourceWithKey(CFSTR("Fill Missing (WFHKSampleFilteringFillMissing)"), CFSTR("Fill Missing"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v34;
  v52[2] = v42;
  WFLocalizedStringResourceWithKey(CFSTR("Whether or not to fill in empty groups with zero values. This is useful to turn off when averaging over a longer period of time."), CFSTR("Whether or not to fill in empty groups with zero values. This is useful to turn off when averaging over a longer period of time."));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v35;
  v53[3] = CFSTR("WFHKSampleFilteringFillMissing");
  v36 = *MEMORY[0x24BEC4518];
  v52[3] = v43;
  v52[4] = v36;
  v53[4] = MEMORY[0x24BDBD1C8];
  v52[5] = *MEMORY[0x24BEC45F0];
  v49[0] = CFSTR("WFResourceClass");
  v49[1] = CFSTR("WFParameterKey");
  v50[0] = CFSTR("WFParameterRelationResource");
  v50[1] = CFSTR("WFHKSampleFilteringGroupBy");
  v49[2] = CFSTR("WFParameterValues");
  v50[2] = v46;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v31, "initWithDictionary:", v39);
  objc_msgSend(v45, "insertObject:atIndex:", v40, 3);

  return v45;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFFindHealthSamplesAction;
  v7 = -[WFContentItemFilterAction setParameterState:forKey:](&v13, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEC4368]))
  {
    -[WFFindHealthSamplesAction configurationData](self, "configurationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringUnit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quantityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setQuantityType:", v10);

    -[WFFindHealthSamplesAction recreateResourcesIfNeeded](self, "recreateResourcesIfNeeded");
    objc_msgSend(v8, "sampleType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFindHealthSamplesAction updateSourcesForSampleType:](self, "updateSourcesForSampleType:", v11);

    -[WFFindHealthSamplesAction updateParameterVisibility](self, "updateParameterVisibility");
  }

  return v7;
}

- (void)updateParameterVisibility
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFFindHealthSamplesAction readableSampleType](self, "readableSampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

    -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringGroupBy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

    -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringFillMissing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v6);

    -[WFFindHealthSamplesAction parameterForKey:](self, "parameterForKey:", CFSTR("WFHKSampleFilteringUnit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v6);

  }
  else
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = 136315138;
      v12 = "-[WFFindHealthSamplesAction updateParameterVisibility]";
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_FAULT, "%s Find health samples action is missing a sample type, which is required", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)updateSourcesForSampleType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  WFFindHealthSamplesAction *v9;

  v4 = a3;
  if (v4)
  {
    -[WFContentItemFilterAction rowForContentPropertyName:](self, "rowForContentPropertyName:", CFSTR("Source"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke;
      v7[3] = &unk_24F8B99F0;
      v8 = v5;
      v9 = self;
      +[WFHealthKitHelper sourcesForSampleType:completion:](WFHealthKitHelper, "sourcesForSampleType:completion:", v4, v7);

    }
  }

}

- (id)query
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFFindHealthSamplesAction;
  -[WFContentItemFilterAction query](&v11, sel_query);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  -[WFFindHealthSamplesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHKSampleFilteringUnit"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("WFHKSampleContentItemQueryUnit"));
  objc_msgSend(v3, "setUserInfo:", v8);

  return v3;
}

- (void)finishRunningWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void (**v13)(void *, uint64_t);
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  void (**v24)(void *, uint64_t);
  char v25;
  objc_super v26;
  _QWORD aBlock[5];
  id v28;
  objc_super v29;

  if (a3)
  {
    v29.receiver = self;
    v29.super_class = (Class)WFFindHealthSamplesAction;
    -[WFFindHealthSamplesAction finishRunningWithError:](&v29, sel_finishRunningWithError_);
  }
  else
  {
    -[WFFindHealthSamplesAction output](self, "output");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v4, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v28);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v28;

    -[WFFindHealthSamplesAction readableSampleType](self, "readableSampleType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!(v9 | v10))
    {
      -[WFFindHealthSamplesAction readableSampleType](self, "readableSampleType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("[WFFindHealthSamplesAction] categoryType and quantityType are nil for readableSampleType = %@, sampleTypeIdentifier = %@"), v11, v8);

    }
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke;
    aBlock[3] = &unk_24F8B9A48;
    aBlock[4] = self;
    v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if (v9)
    {
      if (objc_msgSend(v5, "numberOfItems"))
      {
        v26.receiver = self;
        v26.super_class = (Class)WFFindHealthSamplesAction;
        -[WFFindHealthSamplesAction finishRunningWithError:](&v26, sel_finishRunningWithError_, 0);
      }
      else
      {
        v13[2](v13, v9);
      }
    }
    else
    {
      -[WFFindHealthSamplesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHKSampleFilteringGroupBy"), objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFFindHealthSamplesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHKSampleFilteringFillMissing"), objc_opt_class());
      v14 = v5;
      v15 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      v6 = v15;
      v5 = v14;
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_3;
      v20[3] = &unk_24F8B9A98;
      v20[4] = self;
      v24 = v13;
      v21 = (id)v10;
      v22 = v19;
      v25 = v17;
      v23 = v6;
      v18 = v19;
      objc_msgSend(v5, "getObjectRepresentations:forClass:", v20, objc_opt_class());

    }
  }
}

- (void)finishRunningWithNoSamples
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = (void *)objc_opt_new();
  WFLocalizedString(CFSTR("No Samples Found"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("There are either no %@ samples logged or you need to give Shortcuts access to the samples in the Health app."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFindHealthSamplesAction readableSampleType](self, "readableSampleType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v8);

  v9 = (void *)MEMORY[0x24BE19378];
  WFLocalizedString(CFSTR("OK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke;
  v18[3] = &unk_24F8BB638;
  v18[4] = self;
  objc_msgSend(v9, "buttonWithTitle:style:handler:", v10, 1, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addButton:", v12);

  v13 = (void *)MEMORY[0x24BE19378];
  WFLocalizedString(CFSTR("Open Health"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke_2;
  v17[3] = &unk_24F8BB638;
  v17[4] = self;
  objc_msgSend(v13, "buttonWithTitle:style:handler:", v14, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addButton:", v15);

  -[WFFindHealthSamplesAction userInterface](self, "userInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentAlert:", v3);

}

id __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)WFFindHealthSamplesAction;
  return objc_msgSendSuper2(&v2, sel_finishRunningWithError_, 0);
}

id __55__WFFindHealthSamplesAction_finishRunningWithNoSamples__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("x-apple-health://"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:withBundleIdentifier:userInterface:completionHandler:", v3, CFSTR("com.apple.Health"), 0, 0);

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFFindHealthSamplesAction;
  return objc_msgSendSuper2(&v5, sel_finishRunningWithError_, 0);
}

uint64_t __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v3[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithNoSamples");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_2;
  v3[3] = &unk_24F8B9A20;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[WFHealthKitHelper sourcesForSampleType:completion:](WFHealthKitHelper, "sourcesForSampleType:completion:", a2, v3);
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(void *, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(void *, void *);
  _QWORD v18[5];
  void (**v19)(void *, void *);
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char v26;
  objc_super v27;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_4;
    aBlock[3] = &unk_24F8B9A70;
    v9 = v6;
    v21 = v9;
    v22 = *(id *)(a1 + 48);
    v10 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v23 = v10;
    v24 = v11;
    v26 = *(_BYTE *)(a1 + 72);
    v25 = *(id *)(a1 + 56);
    v12 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFHKSampleFilteringUnit"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v12[2](v12, v13);
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "quantitySample");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "quantityType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_6;
      v18[3] = &unk_24F8BA390;
      v17 = v12;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v17;
      +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v16, v18);

    }
  }
  else if (v7)
  {
    v27.receiver = *(id *)(a1 + 32);
    v27.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v27, sel_finishRunningWithError_, v7);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  WFHKGroupingConfiguration *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  WFHKGroupingConfiguration *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void (**v32)(void *, uint64_t);
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  WFHKQuantitySampleContainer *v55;
  void *v56;
  WFHKQuantitySampleContainer *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void (**v85)(void *, uint64_t);
  id obj;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  WFHKGroupingConfiguration *v96;
  void *context;
  id v98;
  WFHKGroupingIndexPathTransformer *v99;
  _QWORD v100[4];
  id v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  objc_super v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD aBlock[4];
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  WFHKQuantitySampleContainer *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v109 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "setUnit:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
    }
    while (v6);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHealthKitHelper extractHKDataFromContentQuery:](WFHealthKitHelper, "extractHKDataFromContentQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(WFHKGroupingConfiguration);
    v12 = *(id *)(a1 + 40);
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Minute")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Hour")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Day")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Week")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Month")) & 1) != 0)
    {
      v13 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("3 Months")) & 1) != 0)
    {
      v13 = 6;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("Year")))
    {
      v13 = 7;
    }
    else
    {
      v13 = 0;
    }

    -[WFHKGroupingConfiguration setGroupingOption:](v11, "setGroupingOption:", v13);
    -[WFHKGroupingConfiguration setFillMissing:](v11, "setFillMissing:", *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(v10, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKGroupingConfiguration setQueryStartDate:](v11, "setQueryStartDate:", v15);

    v92 = v10;
    objc_msgSend(v10, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHKGroupingConfiguration setQueryEndDate:](v11, "setQueryEndDate:", v16);

    v17 = *(void **)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    v19 = v11;
    v98 = v17;
    v96 = v19;
    if (-[WFHKGroupingConfiguration groupingOption](v19, "groupingOption"))
    {
      v88 = a1;
      v99 = -[WFHKGroupingIndexPathTransformer initWithGroupingOption:]([WFHKGroupingIndexPathTransformer alloc], "initWithGroupingOption:", -[WFHKGroupingConfiguration groupingOption](v19, "groupingOption"));
      v20 = (void *)objc_opt_new();
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v87 = v18;
      v21 = v18;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v121;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v121 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
            objc_msgSend(v26, "quantitySample");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "startDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFHKGroupingIndexPathTransformer transformedValue:](v99, "transformedValue:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              v30 = (void *)objc_opt_new();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, v29);
            }
            objc_msgSend(v30, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v120, v128, 16);
        }
        while (v23);
      }

      if (objc_msgSend(v98, "isRunning"))
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __WFHKGroupedSampleContainers_block_invoke;
        aBlock[3] = &unk_24F8B9AC0;
        v31 = v20;
        v119 = v31;
        v32 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
        v32[2](v32, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v96;
        a1 = v88;
        if (-[WFHKGroupingConfiguration fillMissing](v96, "fillMissing") && objc_msgSend(v31, "count"))
        {
          v84 = v33;
          v85 = v32;
          WFHKInterpolateMissingGroups(v33, v96, v98);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "allKeys");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = objc_claimAutoreleasedReturnValue();

          v90 = v31;
          v83 = (void *)v36;
          objc_msgSend(v31, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = (void *)MEMORY[0x24BDD3E50];
          objc_msgSend(v38, "unit");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "quantityWithUnit:doubleValue:", v40, 0.0);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          v94 = v38;
          objc_msgSend(v38, "quantitySample");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v41 = v34;
          v91 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
          if (v91)
          {
            v89 = *(_QWORD *)v115;
            obj = v41;
            while (2)
            {
              for (k = 0; k != v91; ++k)
              {
                if (*(_QWORD *)v115 != v89)
                  objc_enumerationMutation(obj);
                v43 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * k);
                v44 = (void *)MEMORY[0x22E315218]();
                if (!objc_msgSend(v98, "isRunning"))
                {
                  objc_autoreleasePoolPop(v44);
                  v63 = obj;

                  v62 = 0;
                  a1 = v88;
                  v33 = v84;
                  v32 = v85;
                  v19 = v96;
                  goto LABEL_56;
                }
                -[WFHKGroupingIndexPathTransformer reverseTransformedValue:](v99, "reverseTransformedValue:", v43);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = (void *)objc_msgSend(v45, "copy");
                objc_msgSend(v95, "quantityType");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = objc_msgSend(v47, "isMinimumDurationRestricted");

                context = v44;
                if (v48)
                {
                  objc_msgSend(v95, "quantityType");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "minimumAllowedDuration");
                  objc_msgSend(v45, "dateByAddingTimeInterval:");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v50 = v46;
                }
                v51 = (void *)MEMORY[0x24BDD3E68];
                objc_msgSend(v95, "quantityType");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "metadata");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v52, v93, v45, v50, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                v55 = [WFHKQuantitySampleContainer alloc];
                objc_msgSend(v94, "unit");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = -[WFHKQuantitySampleContainer initWithSample:unit:](v55, "initWithSample:unit:", v54, v56);

                v126 = v57;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = (void *)objc_msgSend(v58, "mutableCopy");
                objc_msgSend(v90, "setObject:forKeyedSubscript:", v59, v43);

                objc_autoreleasePoolPop(context);
              }
              v41 = obj;
              v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
              if (v91)
                continue;
              break;
            }
          }

          a1 = v88;
          v33 = v84;
          v32 = v85;
          v31 = v90;
          v19 = v96;
        }
        if (objc_msgSend(v98, "isRunning"))
        {
          v32[2](v32, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          v112[0] = MEMORY[0x24BDAC760];
          v112[1] = 3221225472;
          v112[2] = __WFHKGroupedSampleContainers_block_invoke_2;
          v112[3] = &unk_24F8B9AE8;
          v113 = v31;
          objc_msgSend(v60, "if_map:", v112);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "if_map:", &__block_literal_global_338);
          v62 = (id)objc_claimAutoreleasedReturnValue();

          v63 = v113;
          v33 = v60;
LABEL_56:

        }
        else
        {
          v62 = 0;
        }

      }
      else
      {
        v62 = 0;
        a1 = v88;
        v19 = v96;
      }

      v64 = v87;
    }
    else
    {
      v64 = v18;
      v62 = v18;
    }

    v65 = (void *)objc_opt_new();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v66 = v62;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v104;
      do
      {
        for (m = 0; m != v68; ++m)
        {
          if (*(_QWORD *)v104 != v69)
            objc_enumerationMutation(v66);
          objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * m));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v71);

        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
      }
      while (v68);
    }

    objc_msgSend(*(id *)(a1 + 56), "query");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_alloc(MEMORY[0x24BE19498]);
    objc_msgSend(MEMORY[0x24BE19480], "truePredicate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v73, "initWithPredicate:", v74);

    objc_msgSend(v72, "sortDescriptors");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setSortDescriptors:", v76);

    v77 = objc_msgSend(v72, "slice");
    objc_msgSend(v75, "setSlice:", v77, v78);
    v79 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(*(id *)(a1 + 56), "contentPermissionRequestor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x24BDAC760];
    v100[1] = 3221225472;
    v100[2] = __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_5;
    v100[3] = &unk_24F8BA068;
    v81 = *(id *)(a1 + 64);
    v82 = *(_QWORD *)(a1 + 56);
    v101 = v81;
    v102 = v82;
    objc_msgSend(v79, "runQuery:withItems:permissionRequestor:completionHandler:", v75, v65, v80, v100);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    v107.receiver = *(id *)(a1 + 56);
    v107.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v107, sel_finishRunningWithError_, v14);
  }

}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = CFSTR("No unit");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WFFindHealthSamplesActionErrorDomain"), 100, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishRunningWithError:", v9);

  }
}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "addItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "setOutput:", *(_QWORD *)(a1 + 32));
  v11.receiver = *(id *)(a1 + 40);
  v11.super_class = (Class)WFFindHealthSamplesAction;
  objc_msgSendSuper2(&v11, sel_finishRunningWithError_, v6);

}

void __52__WFFindHealthSamplesAction_finishRunningWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_super v6;

  v5 = a3;
  if (objc_msgSend(a2, "count"))
  {
    v6.receiver = *(id *)(a1 + 32);
    v6.super_class = (Class)WFFindHealthSamplesAction;
    objc_msgSendSuper2(&v6, sel_finishRunningWithError_, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithNoSamples");
  }

}

void __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  objc_msgSend(a2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_267_44073);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_270_44075);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPossibleValues:", v7);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_4;
  block[3] = &unk_24F8BB638;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", *MEMORY[0x24BEC4368]);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributesDidChange");

}

uint64_t __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

id __56__WFFindHealthSamplesAction_updateSourcesForSampleType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__WFFindHealthSamplesAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3FF8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithResource:", v3);

  return v4;
}

@end
