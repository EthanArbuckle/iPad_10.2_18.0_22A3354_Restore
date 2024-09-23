@implementation HFAbstractBinaryStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    -[HFAbstractBinaryStatusItem oneUnknownServiceFormatString](self, "oneUnknownServiceFormatString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)objc_msgSend(v4, "count") >= 2
         && (-[HFAbstractBinaryStatusItem multipleUnknownServicesFormatString](self, "multipleUnknownServicesFormatString"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%lu"), &v11, objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = v8;
    if (!v5)
      NSLog(CFSTR("Couldn't localize format string in defaultTitleForRepresentedHomeKitObjects. Most likely, the format specifiers don't match. %@"), v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)oneUnknownServiceFormatString
{
  return 0;
}

- (id)multipleUnknownServicesFormatString
{
  return 0;
}

id __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "characteristicTypesForServiceType:includingAssociatedTypes:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "serviceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke;
  v20[3] = &unk_1EA726AB8;
  v20[4] = self;
  objc_msgSend(v5, "na_flatMap:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:containingCharacteristicTypes:](self, "filteredServicesOfTypes:containingCharacteristicTypes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFStatusItem valueSource](self, "valueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readValuesForCharacteristicTypes:inServices:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke_2;
  v16[3] = &unk_1EA72BA38;
  objc_copyWeak(&v18, &location);
  v13 = v5;
  v17 = v13;
  objc_msgSend(v12, "flatMap:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

id __58__HFAbstractBinaryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "standardResultsForBatchReadResponse:serviceTypes:", v3, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hidden"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "futureWithResult:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("state"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    if (v17 == 1)
    {
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v5, "oneNormalServiceFormatString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "oneNormalServiceDescriptionString");
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "multipleNormalServicesFormatString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%lu"), 0, objc_msgSend(v11, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "multipleNormalServicesDescriptionString");
      }
    }
    else
    {
      if (v17 != 2)
      {
        v20 = 0;
        goto LABEL_17;
      }
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v5, "oneAbnormalServiceFormatString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "oneAbnormalServiceDescriptionString");
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "multipleAbnormalServicesFormatString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%lu"), 0, objc_msgSend(v11, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "multipleAbnormalServicesDescriptionString");
      }
    }
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("title"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("description"));

LABEL_18:
      v25 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "futureWithResult:", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
LABEL_17:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    goto LABEL_18;
  }
  v13 = (void *)MEMORY[0x1E0D519C0];
  v28 = CFSTR("hidden");
  v29[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithResult:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v12;
}

- (id)oneAbnormalServiceFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 95, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem oneAbnormalServiceFormatString]", objc_opt_class());

  return 0;
}

- (id)oneNormalServiceFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 101, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem oneNormalServiceFormatString]", objc_opt_class());

  return 0;
}

- (id)multipleAbnormalServicesFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 107, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem multipleAbnormalServicesFormatString]", objc_opt_class());

  return 0;
}

- (id)multipleNormalServicesFormatString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 113, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem multipleNormalServicesFormatString]", objc_opt_class());

  return 0;
}

- (id)oneAbnormalServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 120, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem oneAbnormalServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)oneNormalServiceDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 126, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem oneNormalServiceDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleAbnormalServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 132, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem multipleAbnormalServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)multipleNormalServicesDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAbstractBinaryStatusItem.m"), 138, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFAbstractBinaryStatusItem multipleNormalServicesDescriptionString]", objc_opt_class());

  return 0;
}

- (id)_shortTitleForTitle:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
