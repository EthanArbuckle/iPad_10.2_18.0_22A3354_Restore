@implementation GEOLPRRestrictionRegion(MNExtras)

- (id)plateTypeIndexesMatchingVehicle:()MNExtras error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  objc_msgSend(a1, "definedPlateTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__GEOLPRRestrictionRegion_MNExtras__plateTypeIndexesMatchingVehicle_error___block_invoke;
  v14[3] = &unk_1E61D2DE8;
  v9 = v6;
  v15 = v9;
  v17 = &v18;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v11 = (void *)v19[5];
  if (v11)
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    v12 = v10;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

@end
