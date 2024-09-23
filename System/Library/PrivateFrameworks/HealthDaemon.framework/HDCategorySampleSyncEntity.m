@implementation HDCategorySampleSyncEntity

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (int)nanoSyncObjectType
{
  return 1;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 2);
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "sample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataType");

  if ((_HKValidDataTypeCode() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6378], "createWithCodable:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v5, "sample");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = a1;
      v14 = 2048;
      v15 = objc_msgSend(v10, "dataType");
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignorning unknown data type code %lld", (uint8_t *)&v12, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
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
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, void *, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD aBlock[4];
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[3];
  _QWORD v68[2];
  void *v69;
  _QWORD v70[25];

  v70[23] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsSampleExpiration");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 95);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v56;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 96);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v54;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 91);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v52;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 97);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v51;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 90);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v50;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 92);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v70[5] = v49;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 243);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v70[6] = v48;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 244);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v70[7] = v47;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 157);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v70[8] = v46;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 158);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v70[9] = v45;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 159);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v70[10] = v44;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 160);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v70[11] = v43;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 161);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v70[12] = v42;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 162);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v70[13] = v41;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 163);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v70[14] = v9;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 164);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v70[15] = v10;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 165);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v70[16] = v11;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 166);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v70[17] = v12;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 167);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70[18] = v13;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 168);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v70[19] = v14;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 169);
    v61 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70[20] = v15;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 170);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v70[21] = v16;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 171);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70[22] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 23);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6380], "_categoryTypeWithCode:", 63);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 178);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 199);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 192);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 191);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v22;
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 193);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HDCategorySampleSyncEntity__basePruningPredicateForDate_profile___block_invoke;
    aBlock[3] = &unk_1E6D10888;
    v63 = v58;
    v26 = v61;
    v64 = v26;
    v65 = v24;
    v66 = v25;
    v27 = v25;
    v28 = v24;
    v59 = v58;
    v29 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    v29[2](v29, v60, *MEMORY[0x1E0CB6130]);
    v29[2](v29, v57, *MEMORY[0x1E0CB6140]);
    v29[2](v29, v55, *MEMORY[0x1E0CB6108]);
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 190);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v30);
    objc_msgSend(v27, "addObjectsFromArray:", v53);
    objc_msgSend(v59, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", 0, v26, *MEMORY[0x1E0CB6120]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0D29840];
    HDSampleEntityPredicateForDataTypes(v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "negatedPredicate:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "compoundPredicateWithPredicate:otherPredicate:", v31, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "addObject:", v35);
    v36 = (void *)MEMORY[0x1E0D29840];
    v37 = (void *)objc_msgSend(v28, "copy");
    v38 = v36;
    v5 = v61;
    objc_msgSend(v38, "predicateMatchingAnyPredicates:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

void __67__HDCategorySampleSyncEntity__basePruningPredicateForDate_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:", v7, v6, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v7);

}

+ (id)_predicateForSyncSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0D29890];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HDCategorySampleSyncEntity;
  objc_msgSendSuper2(&v9, sel__predicateForSyncSession_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForCategoryTypesToSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_categoryTypesDerivedFromQuantitySamples
{
  void *v0;
  void *v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48D8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_predicateForCategoryTypesToSync
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D29840];
  +[HDCategorySampleSyncEntity _categoryTypesDerivedFromQuantitySamples]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "negatedPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
