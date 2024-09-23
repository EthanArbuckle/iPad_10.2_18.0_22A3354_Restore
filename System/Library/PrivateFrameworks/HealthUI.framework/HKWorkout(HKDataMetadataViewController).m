@implementation HKWorkout(HKDataMetadataViewController)

- (void)fetchSubSampleTypesWithHealthStore:()HKDataMetadataViewController completion:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB6A78];
  v8 = a3;
  objc_msgSend(v7, "predicateForObjectsFromWorkout:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB7020]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HKWorkout_HKDataMetadataViewController__fetchSubSampleTypesWithHealthStore_completion___block_invoke;
  v13[3] = &unk_1E9C454C0;
  v14 = v6;
  v11 = v6;
  v12 = (void *)objc_msgSend(v10, "initWithPredicate:resultsHandler:", v9, v13);
  objc_msgSend(v8, "executeQuery:", v12);

}

@end
