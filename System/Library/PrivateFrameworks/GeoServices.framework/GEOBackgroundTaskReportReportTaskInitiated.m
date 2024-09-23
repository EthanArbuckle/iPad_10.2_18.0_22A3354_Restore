@implementation GEOBackgroundTaskReportReportTaskInitiated

id __GEOBackgroundTaskReportReportTaskInitiated_block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (qword_1ECDBBA18 != -1)
    dispatch_once(&qword_1ECDBBA18, &__block_literal_global_22);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)_MergedGlobals_189;
  objc_msgSend(v3, "components:fromDate:", 64, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "minute");
  if (v5 >= 0)
    v6 = v5;
  else
    v6 = v5 + 1;
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = CFSTR("task_name");
  v11[1] = CFSTR("task_runtime_bucket");
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 >> 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
