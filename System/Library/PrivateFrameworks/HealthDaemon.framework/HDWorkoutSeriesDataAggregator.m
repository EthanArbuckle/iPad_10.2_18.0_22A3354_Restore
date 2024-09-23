@implementation HDWorkoutSeriesDataAggregator

- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8
{
  void *v8;
  char v9;

  -[HDDataAggregator configuration](self, "configuration", a3, a4, a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasActiveWorkout");

  return v9;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "hasActiveWorkout");
  -[HDDataAggregator configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasActiveWorkout");

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__HDWorkoutSeriesDataAggregator_setConfiguration___block_invoke;
    v10[3] = &unk_1E6CE77C8;
    v10[4] = self;
    -[HDActiveDataAggregator requestAggregationThroughDate:mode:options:completion:](self, "requestAggregationThroughDate:mode:options:completion:", v8, 0, 3, v10);

  }
  v9.receiver = self;
  v9.super_class = (Class)HDWorkoutSeriesDataAggregator;
  -[HDDataAggregator setConfiguration:](&v9, sel_setConfiguration_, v4);

}

void __50__HDWorkoutSeriesDataAggregator_setConfiguration___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB52A8];
  v7 = *MEMORY[0x1E0CB52A8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v8;
      _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: setConfiguration requestedAggregation success", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v6;
    objc_msgSend(v5, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: setConfiguration requestedAggregation error: %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

@end
