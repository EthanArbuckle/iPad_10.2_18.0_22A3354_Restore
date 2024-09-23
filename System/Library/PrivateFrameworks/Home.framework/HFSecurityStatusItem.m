@implementation HFSecurityStatusItem

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  void *v3;
  HFImageIconDescriptor *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", a3, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("light.beacon.min.fill"), v3);

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)*MEMORY[0x1E0CB9AA8];
  objc_msgSend((id)objc_opt_class(), "characteristicTypesForServiceType:includingAssociatedTypes:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:containingCharacteristicTypes:](self, "filteredServicesOfTypes:containingCharacteristicTypes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFStatusItem valueSource](self, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "readValuesForCharacteristicTypes:inServices:", v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_1EA72DAB8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v12;
}

id __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  HFCAPackageIconDescriptor *v33;
  void *v34;
  HFCAPackageIconDescriptor *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  const __CFString *v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
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
LABEL_28:

      goto LABEL_29;
    }
    v15 = v3;
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
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = 3221225472;
    v54[2] = __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke_2;
    v54[3] = &unk_1EA7306D0;
    v53 = v15;
    v54[0] = MEMORY[0x1E0C809B0];
    v23 = v15;
    v55 = v23;
    v56 = WeakRetained;
    v24 = v17;
    v57 = v24;
    v25 = v19;
    v58 = v25;
    v52 = v21;
    v59 = v52;
    v26 = v20;
    v60 = v26;
    v27 = v18;
    v61 = v27;
    v10 = v16;
    v62 = v10;
    objc_msgSend(v22, "na_each:", v54);

    v51 = v26;
    if (objc_msgSend(v24, "count"))
    {
      v28 = v25;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CBF98, CFSTR("badge"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CBFB0, CFSTR("statusItemCategory"));
      _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSecuritySystem"), CFSTR("HFStatusTitleSecuritySystem"), 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("title"));

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("statusRepresentedHomeKitObjects"));
      objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("icon"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32)
      {
        v33 = [HFCAPackageIconDescriptor alloc];
        objc_msgSend(v32, "packageIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:](v33, "initWithPackageIdentifier:state:", v34, HFCAPackageStateActivated);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("icon"));

      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CBFC8, CFSTR("state"));
      _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDescriptionSecuritySystem_Triggered"), CFSTR("HFStatusDescriptionSecuritySystem_Triggered"), 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("description"));

      objc_msgSend((id)objc_opt_class(), "_shortDescriptionForSecuritySystemState:", 4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("shortDescription"));

      v25 = v28;
      goto LABEL_27;
    }
    if (!objc_msgSend(v10, "count"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
LABEL_27:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("representedHomeKitObjects"));
      v47 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "futureWithResult:", v48);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v53;
      goto LABEL_28;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CBFE0, CFSTR("statusItemCategory"));
    if (objc_msgSend(v25, "count"))
    {
      v38 = CFSTR("HFStatusTitleSecuritySystem_Arming");
    }
    else
    {
      if (!objc_msgSend(v26, "count"))
      {
        v39 = 0;
        goto LABEL_19;
      }
      v38 = CFSTR("HFStatusTitleSecuritySystem_Disarming");
    }
    _HFLocalizedStringWithDefaultValue(v38, v38, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA7CBFF8, CFSTR("state"), v25);
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSecuritySystem"), CFSTR("HFStatusTitleSecuritySystem"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("title"));

    if (v39)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("description"));
    objc_msgSend(v23, "responseForCharacteristicType:aggregationPolicy:", *MEMORY[0x1E0CB8888], 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = v39;
      v43 = v27;
      objc_msgSend(v41, "valueWithExpectedClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "integerValue");

      objc_msgSend((id)objc_opt_class(), "_shortDescriptionForSecuritySystemState:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("shortDescription"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("description"));
      if (v45 <= 2)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));

      v27 = v43;
      v39 = v42;
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }

    v25 = v50;
    goto LABEL_27;
  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v63 = CFSTR("hidden");
  v64[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
  return v11;
}

+ (NSSet)serviceTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB9AA8]);
}

void __52__HFSecurityStatusItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id *v12;
  id v13;
  char v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(a1[4], "batchResponseForService:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8888]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithExpectedClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8B00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithExpectedClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = objc_msgSend(v5, "integerValue");
    v10 = objc_msgSend(v7, "integerValue");
    v11 = objc_msgSend((id)objc_opt_class(), "_currentState:matchesTargetState:", v9, v10);
    if (v9 == 4)
    {
      v12 = a1 + 6;
      v13 = v16;
LABEL_18:
      objc_msgSend(*v12, "addObject:", v13);
      objc_msgSend(a1[11], "addObject:", v16);
      goto LABEL_19;
    }
    v14 = v11;
    if (!objc_msgSend(v16, "hf_hasSetVisibleInHomeStatus")
      || (objc_msgSend(v16, "hf_isVisibleInHomeStatus") & 1) != 0
      || (objc_msgSend(a1[5], "room"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      if (v9 == 3)
      {
        v13 = v16;
        if ((v14 & 1) != 0)
        {
          v12 = a1 + 8;
          goto LABEL_18;
        }
      }
      else
      {
        v13 = v16;
        if (v10 == 3)
        {
          v12 = a1 + 9;
          goto LABEL_18;
        }
        if ((v14 & 1) != 0)
        {
          v12 = a1 + 10;
          goto LABEL_18;
        }
      }
      v12 = a1 + 7;
      goto LABEL_18;
    }
  }
LABEL_19:

}

+ (id)_shortDescriptionForSecuritySystemState:(int64_t)a3
{
  if ((unint64_t)a3 <= 4)
  {
    _HFLocalizedStringWithDefaultValue(off_1EA7306F0[a3], off_1EA7306F0[a3], 1);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (BOOL)_currentState:(int64_t)a3 matchesTargetState:(int64_t)a4
{
  BOOL v4;
  BOOL result;

  switch(a4)
  {
    case 0:
      v4 = a3 == 0;
      goto LABEL_7;
    case 1:
      v4 = a3 == 1;
      goto LABEL_7;
    case 2:
      v4 = a3 == 2;
      goto LABEL_7;
    case 3:
      v4 = a3 == 3;
LABEL_7:
      result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
