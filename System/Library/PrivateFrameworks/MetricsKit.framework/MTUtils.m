@implementation MTUtils

- (id)applyFieldsMap:(id)a3 sectionName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[MTObject metricsKit](self, "metricsKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "config");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__MTUtils_applyFieldsMap_sectionName___block_invoke;
  v15[3] = &unk_24C7A02B8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "thenWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __38__MTUtils_applyFieldsMap_sectionName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("fieldsMap"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  +[MTEventFieldsUtil applyFieldsMap:data:sectionName:error:](MTEventFieldsUtil, "applyFieldsMap:data:sectionName:error:", v6, v7, v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "metricsKit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("treatmentProfiles."), "stringByAppendingString:", *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configValueForKeyPath:sources:", v13, v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        +[MTTreatmentProfile treatmentProfileWithConfigData:](MTTreatmentProfile, "treatmentProfileWithConfigData:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "performTreatments:", *(_QWORD *)(a1 + 40));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = 0;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }
  if (v10)
  {
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
      v18 = v9;
    else
      v18 = (void *)MEMORY[0x24BDBD1B8];
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v18);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;

  return v19;
}

@end
