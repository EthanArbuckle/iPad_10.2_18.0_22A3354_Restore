@implementation NSDate(TimeManipulationForTesting)

+ (uint64_t)test_performBlockWithAbilityToManipulateTime:()TimeManipulationForTesting
{
  void (**v4)(_QWORD);

  v4 = a3;
  objc_msgSend(a1, "test_beginManipulationOfTime");
  v4[2](v4);

  return objc_msgSend(a1, "test_endManipulationOfTime");
}

+ (void)test_beginManipulationOfTime
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[6];

  dateManipulationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  dateManipulationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NSDate_TimeManipulationForTesting__test_beginManipulationOfTime__block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  dispatch_barrier_sync(v5, block);

}

+ (void)test_endManipulationOfTime
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[6];

  dateManipulationQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  dateManipulationQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__NSDate_TimeManipulationForTesting__test_endManipulationOfTime__block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  dispatch_barrier_sync(v5, block);

}

+ (void)test_setCurrentDate:()TimeManipulationForTesting
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  dateManipulationQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__NSDate_TimeManipulationForTesting__test_setCurrentDate___block_invoke;
  block[3] = &unk_1E4D57710;
  v10 = a2;
  v11 = a1;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, block);

}

+ (void)test_adjustCurrentDateWithTimeInterval:()TimeManipulationForTesting
{
  NSObject *v6;
  _QWORD block[7];

  dateManipulationQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__NSDate_TimeManipulationForTesting__test_adjustCurrentDateWithTimeInterval___block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  *(double *)&block[6] = a3;
  dispatch_barrier_async(v6, block);

}

+ (id)_atx_now
{
  NSObject *v0;
  id v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__23;
  v8 = __Block_byref_object_dispose__23;
  v9 = 0;
  dateManipulationQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NSDate_TimeManipulationForTesting___atx_now__block_invoke;
  block[3] = &unk_1E4D570B8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (id)_atx_date
{
  NSObject *v0;
  id v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__23;
  v8 = __Block_byref_object_dispose__23;
  v9 = 0;
  dateManipulationQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NSDate_TimeManipulationForTesting___atx_date__block_invoke;
  block[3] = &unk_1E4D570B8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (id)_atx_dateWithTimeIntervalSinceNow:()TimeManipulationForTesting
{
  NSObject *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  v11 = 0;
  dateManipulationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__NSDate_TimeManipulationForTesting___atx_dateWithTimeIntervalSinceNow___block_invoke;
  v5[3] = &unk_1E4D5D558;
  v5[4] = &v6;
  *(double *)&v5[5] = a1;
  dispatch_sync(v2, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (double)_atx_timeIntervalSinceReferenceDate
{
  NSObject *v0;
  double v1;
  _QWORD block[5];
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  dateManipulationQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceReferenceDate__block_invoke;
  block[3] = &unk_1E4D570B8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (double)_atx_timeIntervalSinceNow
{
  NSObject *v2;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  dateManipulationQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceNow__block_invoke;
  v5[3] = &unk_1E4D590F8;
  v5[4] = a1;
  v5[5] = &v6;
  dispatch_sync(v2, v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
