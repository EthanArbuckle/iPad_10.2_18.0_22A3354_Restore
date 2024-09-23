@implementation HDWorkoutEntityEncoder

void __74___HDWorkoutEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  HDCodableWorkoutEvent *v12;

  v9 = a3;
  v12 = objc_alloc_init(HDCodableWorkoutEvent);
  -[HDCodableWorkoutEvent setDate:](v12, "setDate:", a4);
  -[HDCodableWorkoutEvent setType:](v12, "setType:", a2);
  -[HDCodableWorkoutEvent setDuration:](v12, "setDuration:", a5);
  objc_msgSend(v9, "hk_codableMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutEvent setMetadataDictionary:](v12, "setMetadataDictionary:", v10);

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB55C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[HDCodableWorkoutEvent setSwimmingStrokeStyle:](v12, "setSwimmingStrokeStyle:", objc_msgSend(v11, "longLongValue"));
  objc_msgSend(*(id *)(a1 + 32), "addEvents:", v12);

}

uint64_t __74___HDWorkoutEntityEncoder_applyPropertiesToObject_persistentID_row_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v8);

  return 1;
}

@end
