@implementation HDMedicationsAppSourceSupport

+ (id)medicationsAppSourceEntityForProfile:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CB5140];
  v6 = MEMORY[0x1E0C9AAB0];
  v19[0] = MEMORY[0x1E0C9AAB0];
  v7 = *MEMORY[0x1E0CB5F28];
  v18[0] = v5;
  v18[1] = v7;
  v17 = *MEMORY[0x1E0CB7680];
  v8 = v17;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = *MEMORY[0x1E0CB5988];
  v19[1] = v11;
  v19[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6F90], "entitlementsWithDictionary:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceForApplicationIdentifier:createOrUpdateIfNecessary:entitlements:name:error:", v8, 1, v14, 0, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
