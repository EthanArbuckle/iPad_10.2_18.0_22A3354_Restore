@implementation WFHKCorrelationContentItem

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
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

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Blood pressure"), CFSTR("Blood pressure"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Blood pressures"), CFSTR("Blood pressures"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Blood pressures"));
}

- (id)correlation
{
  return (id)-[WFHKCorrelationContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  void (**v7)(id, void *, _QWORD);
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void (**v48)(id, void *, _QWORD);
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, void *, _QWORD))a3;
  v8 = (void *)objc_opt_new();
  -[WFHKCorrelationContentItem correlation](self, "correlation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((Class)objc_opt_class() == a5)
  {
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKey:", CFSTR("startDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("endDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToDate:", v18))
    {
      v19 = (void *)MEMORY[0x24BE19590];
      WFLocalizedString(CFSTR("Blood Pressure Date"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v11;
    }
    else
    {
      if (v11)
      {
        v42 = (void *)MEMORY[0x24BE19590];
        WFLocalizedString(CFSTR("Blood Pressure Start Date"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "object:named:", v11, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v44);

      }
      if (!v18)
        goto LABEL_21;
      v45 = (void *)MEMORY[0x24BE19590];
      WFLocalizedString(CFSTR("Blood Pressure End Date"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v45;
      v22 = v18;
    }
    objc_msgSend(v21, "object:named:", v22, v20);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v46);

LABEL_21:
    v7[2](v7, v8, 0);

    goto LABEL_22;
  }
  if ((Class)objc_opt_class() != a5)
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(v9, "correlationType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD2B08]);

  if (v25)
  {
    v48 = v7;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v47 = v10;
    objc_msgSend(v10, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectsMatchingClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v27;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          v32 = v8;
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v33, "quantityType");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v33, "quantity");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD4048], "millimeterOfMercuryUnit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValueForUnit:", v39);
          objc_msgSend(v37, "numberWithDouble:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BE19590], "object:named:", v40, v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v32;
          objc_msgSend(v32, "addObject:", v41);

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v29);
    }

    v7 = v48;
    v10 = v47;
  }
  v7[2](v7, v8, 0);
LABEL_23:

}

@end
