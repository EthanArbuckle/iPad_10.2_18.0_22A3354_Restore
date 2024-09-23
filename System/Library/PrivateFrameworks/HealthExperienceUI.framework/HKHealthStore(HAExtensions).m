@implementation HKHealthStore(HAExtensions)

- (void)mostRecentSampleOfType:()HAExtensions predicate:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "queryForMostRecentSampleOfType:predicate:completion:", v10, v9, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "executeQuery:", v11);
}

- (void)mostRecentQuantitySampleOfType:()HAExtensions predicate:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore_HAExtensions__mostRecentQuantitySampleOfType_predicate_completion___block_invoke;
  v10[3] = &unk_1E55755E0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "mostRecentSampleOfType:predicate:completion:", a3, a4, v10);

}

- (void)mostRecentCategorySampleOfType:()HAExtensions predicate:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HKHealthStore_HAExtensions__mostRecentCategorySampleOfType_predicate_completion___block_invoke;
  v10[3] = &unk_1E55755E0;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "mostRecentSampleOfType:predicate:completion:", a3, a4, v10);

}

- (void)averageQuantityForType:()HAExtensions unit:predicate:completion:
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  v10 = a4;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0CB6C88];
  v13 = a5;
  v14 = a3;
  v15 = [v12 alloc];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __80__HKHealthStore_HAExtensions__averageQuantityForType_unit_predicate_completion___block_invoke;
  v22 = &unk_1E5575608;
  v23 = v10;
  v24 = v11;
  v16 = v10;
  v17 = v11;
  v18 = (void *)objc_msgSend(v15, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v14, v13, 2, &v19);

  objc_msgSend(a1, "executeQuery:", v18, v19, v20, v21, v22);
}

- (void)calculateBMIWithCompletion:()HAExtensions
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD aBlock[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];

  v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5575630;
  v20 = v23;
  v21 = v25;
  v22 = v24;
  v6 = v4;
  v19 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_2;
  v15[3] = &unk_1E5575680;
  v17 = v25;
  v9 = v7;
  v16 = v9;
  objc_msgSend(a1, "mostRecentQuantitySampleOfType:predicate:completion:", v8, 0, v15);

  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __58__HKHealthStore_HAExtensions__calculateBMIWithCompletion___block_invoke_4;
  v12[3] = &unk_1E5575680;
  v14 = v24;
  v11 = v9;
  v13 = v11;
  objc_msgSend(a1, "mostRecentQuantitySampleOfType:predicate:completion:", v10, 0, v12);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);

}

@end
