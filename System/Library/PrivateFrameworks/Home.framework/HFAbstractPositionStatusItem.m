@implementation HFAbstractPositionStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
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
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "serviceTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicTypesForServiceType:includingAssociatedTypes:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "serviceTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:containingCharacteristicTypes:](self, "filteredServicesOfTypes:containingCharacteristicTypes:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAbstractPositionStatusItem _characteristicsToReadForCharacteristicTypes:inServices:](self, "_characteristicsToReadForCharacteristicTypes:inServices:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[HFStatusItem valueSource](self, "valueSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "readValuesForCharacteristics:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke;
  v18[3] = &unk_1EA72DAB8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v15, "flatMap:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v16;
}

- (id)_characteristicsToReadForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke;
  v9[3] = &unk_1EA726AB8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_characteristicOfType:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v5);

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CB8790]) & 1) == 0)
  {
    objc_msgSend(v3, "hf_childServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_3;
    v8[3] = &unk_1EA73A7A0;
    v9 = v4;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v6, "na_each:", v8);

  }
  return v4;
}

id __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_2;
  v8[3] = &unk_1EA73A7C8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "serviceTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "standardResultsForBatchReadResponse:serviceTypes:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hidden"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "BOOLValue");

    if ((_DWORD)v6)
    {
      v9 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "futureWithResult:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:

      goto LABEL_59;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke_2;
    v46[3] = &unk_1EA73A778;
    v47 = v3;
    v10 = v15;
    v48 = v10;
    v45 = v20;
    v49 = v45;
    v22 = v18;
    v50 = v22;
    v23 = v16;
    v51 = v23;
    v24 = v17;
    v52 = v24;
    v25 = v19;
    v53 = v25;
    v44 = v21;
    objc_msgSend(v21, "na_each:", v46);
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "unionSet:", v24);
      objc_msgSend(v23, "unionSet:", v22);
    }
    if (objc_msgSend(v10, "count"))
    {
      if (objc_msgSend(v10, "count") == 1)
        objc_msgSend(WeakRetained, "oneServiceTitleString");
      else
        objc_msgSend(WeakRetained, "multipleServiceTitleFormatString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") == 1)
        objc_msgSend(WeakRetained, "oneObstructedServiceDescriptionString");
      else
        objc_msgSend(WeakRetained, "multipleObstructedServicesDescriptionString");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v10;
    }
    else if (objc_msgSend(v23, "count"))
    {
      if (objc_msgSend(v23, "count") == 1)
        objc_msgSend(WeakRetained, "oneServiceTitleString");
      else
        objc_msgSend(WeakRetained, "multipleServiceTitleFormatString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count") == 1)
        objc_msgSend(WeakRetained, "oneOpenServiceDescriptionString");
      else
        objc_msgSend(WeakRetained, "multipleOpenServicesDescriptionString");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v23;
    }
    else if (objc_msgSend(v24, "count"))
    {
      if (objc_msgSend(v24, "count") == 1)
        objc_msgSend(WeakRetained, "oneServiceTitleString");
      else
        objc_msgSend(WeakRetained, "multipleServiceTitleFormatString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count") == 1)
        objc_msgSend(WeakRetained, "oneOpeningServiceDescriptionString");
      else
        objc_msgSend(WeakRetained, "multipleOpeningServicesDescriptionString");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v24;
    }
    else if (objc_msgSend(v22, "count"))
    {
      if (objc_msgSend(v22, "count") == 1)
        objc_msgSend(WeakRetained, "oneServiceTitleString");
      else
        objc_msgSend(WeakRetained, "multipleServiceTitleFormatString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count") == 1)
        objc_msgSend(WeakRetained, "oneClosingServiceDescriptionString");
      else
        objc_msgSend(WeakRetained, "multipleClosingServicesDescriptionString");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v22;
    }
    else
    {
      if (!objc_msgSend(v25, "count"))
      {
        v26 = 0;
        v28 = 0;
        v41 = 0;
        goto LABEL_49;
      }
      if (objc_msgSend(v25, "count") == 1)
        objc_msgSend(WeakRetained, "oneServiceTitleString");
      else
        objc_msgSend(WeakRetained, "multipleServiceTitleFormatString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "count") == 1)
        objc_msgSend(WeakRetained, "oneClosedServiceDescriptionString");
      else
        objc_msgSend(WeakRetained, "multipleClosedServicesDescriptionString");
      v41 = objc_claimAutoreleasedReturnValue();
      v27 = v25;
    }
    v28 = v27;
LABEL_49:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("obstructedServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("openServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("openingServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("closingServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("closedServices"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, CFSTR("unknownServices"));
    v42 = v3;
    v43 = v24;
    v40 = v22;
    if (v26)
    {
      v29 = v25;
      if (objc_msgSend(v28, "count") == 1)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("title"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v26, CFSTR("%lu"), 0, objc_msgSend(v28, "count"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("title"));

      }
      v35 = CFSTR("description");
      v34 = v7;
      v32 = (void *)v41;
      v33 = v41;
    }
    else
    {
      v29 = v25;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusItemCategory"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");

      v32 = (void *)v41;
      if (v31 != 3)
      {
LABEL_57:
        v37 = (void *)MEMORY[0x1E0D519C0];
        +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "futureWithResult:", v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = v42;
        goto LABEL_58;
      }
      v33 = MEMORY[0x1E0C9AAB0];
      v34 = v7;
      v35 = CFSTR("hidden");
    }
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v35);
    goto LABEL_57;
  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v54 = CFSTR("hidden");
  v55[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_59:
  return v11;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HFStatusItem displayNameForHomeKitObject:](self, "displayNameForHomeKitObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[HFAbstractPositionStatusItem multipleServiceTitleFormatString](self, "multipleServiceTitleFormatString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%lu"), &v10, objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;

    if (!v6)
      NSLog(CFSTR("Couldn't localize format string in defaultTitleForRepresentedHomeKitObjects. Most likely, the format specifiers don't match. %@"), v5);
  }

LABEL_8:
  return v6;
}

void __60__HFAbstractPositionStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  BOOL v10;
  id *v11;
  id v12;

  v12 = a2;
  objc_msgSend(a1[4], "batchResponseForService:includeChildServices:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicValueDisplayMetadata displayMetadataForService:characteristicReadResponse:](HFCharacteristicValueDisplayMetadata, "displayMetadataForService:characteristicReadResponse:", v12, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8980]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "BOOLValue"))
    objc_msgSend(a1[5], "addObject:", v12);
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "integerValue") == 2)
    {
      objc_msgSend(a1[5], "addObject:", v12);
    }
    else if (objc_msgSend(v8, "integerValue") == 3)
    {
      v9 = a1 + 6;
LABEL_15:
      objc_msgSend(*v9, "addObject:", v12);
      goto LABEL_16;
    }
  }
  if (objc_msgSend(v4, "primaryState") == 2)
  {
    v10 = objc_msgSend(v4, "transitioningPrimaryState") == 1;
    v9 = a1 + 8;
    v11 = a1 + 7;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "primaryState") == 1)
  {
    v10 = objc_msgSend(v4, "transitioningPrimaryState") == 2;
    v9 = a1 + 10;
    v11 = a1 + 9;
LABEL_12:
    if (v10)
      v9 = v11;
    goto LABEL_15;
  }
LABEL_16:

}

- (id)oneServiceTitleString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 164, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneServiceTitleString]", objc_opt_class());

  return 0;
}

- (id)multipleServiceTitleFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 170, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleServiceTitleFormatString]", objc_opt_class());

  return 0;
}

- (id)oneObstructedServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 176, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneObstructedServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleObstructedServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 182, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleObstructedServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)oneOpenServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 188, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneOpenServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleOpenServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 194, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleOpenServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)oneOpeningServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 200, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneOpeningServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleOpeningServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 206, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleOpeningServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)oneClosingServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 212, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneClosingServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleClosingServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 218, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleClosingServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)oneClosedServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 224, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem oneClosedServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleClosedServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractPositionStatusItem.m"), 230, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractPositionStatusItem multipleClosedServicesDescriptionString]", objc_opt_class());

  return 0;
}

void __88__HFAbstractPositionStatusItem__characteristicsToReadForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hf_characteristicOfType:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

}

@end
