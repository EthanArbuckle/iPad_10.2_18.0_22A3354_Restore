@implementation HKQuantitySample(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  HKDataMetadataBeatToBeatSection *v18;
  void *v19;
  HKDataMetadataBeatToBeatSection **v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  HKDataMetadataBeatToBeatSection *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(a1, "quantityType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "code") == 139)
  {
    objc_msgSend(a1, "sourceRevision");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "_isAppleWatch");

    if (v17)
    {
      v18 = -[HKDataMetadataBeatToBeatSection initWithSample:healthStore:displayTypeController:unitController:]([HKDataMetadataBeatToBeatSection alloc], "initWithSample:healthStore:displayTypeController:unitController:", a1, v10, v11, v12);
      v35[0] = v18;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = (HKDataMetadataBeatToBeatSection **)v35;
LABEL_14:
      objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(a1, "quantityType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "code") == 14)
  {
    objc_msgSend(a1, "sourceRevision");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "source");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "_hasFirstPartyBundleID");

    if (v24)
    {
      objc_msgSend(a1, "metadata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CB5608];
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5608]);
      v27 = objc_claimAutoreleasedReturnValue();
      if (!v27)
      {

LABEL_13:
        v18 = -[HKDataMetadataOxygenSaturationSection initWithSample:healthStore:displayTypeController:unitController:subsampleDelegate:]([HKDataMetadataOxygenSaturationSection alloc], "initWithSample:healthStore:displayTypeController:unitController:subsampleDelegate:", a1, v10, v11, v12, v13);
        v34 = v18;
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = &v34;
        goto LABEL_14;
      }
      v28 = (void *)v27;
      objc_msgSend(a1, "metadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqual:", MEMORY[0x1E0C9AAA0]);

      if (v31)
        goto LABEL_13;
    }
  }
  else
  {

  }
  v32 = (void *)MEMORY[0x1E0C9AA60];
LABEL_15:

  return v32;
}

@end
