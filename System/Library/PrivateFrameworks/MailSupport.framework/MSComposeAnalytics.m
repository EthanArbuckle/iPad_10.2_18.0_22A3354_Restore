@implementation MSComposeAnalytics

+ (EFScheduler)scheduler
{
  if (scheduler_onceToken != -1)
    dispatch_once(&scheduler_onceToken, &__block_literal_global_0);
  return (EFScheduler *)(id)scheduler_scheduler;
}

void __31__MSComposeAnalytics_scheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.compose-analytics"), -1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)scheduler_scheduler;
  scheduler_scheduler = v0;

}

+ (void)sendAnalyticsSignal:(int64_t)a3 threadIdentifier:(id)a4 isDraft:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  __CFString *v13;
  id v14;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v5 = a5;
  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v8 = (__CFString *)(id)*MEMORY[0x1E0D3AB28];
      v19 = *MEMORY[0x1E0D3AB00];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      v11 = (id *)MEMORY[0x1E0D3AB20];
      goto LABEL_5;
    case 3:
      v11 = (id *)MEMORY[0x1E0D3AB18];
LABEL_5:
      v8 = (__CFString *)*v11;
      v10 = 0;
      break;
    default:
      v10 = 0;
      v8 = CFSTR("Unknown");
      break;
  }
  +[MSComposeAnalytics scheduler](MSComposeAnalytics, "scheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__MSComposeAnalytics_sendAnalyticsSignal_threadIdentifier_isDraft___block_invoke;
  v15[3] = &unk_1E716DB68;
  v13 = v8;
  v16 = v13;
  v17 = v7;
  v18 = v10;
  v14 = v10;
  objc_msgSend(v12, "performBlock:", v15);

LABEL_8:
}

uint64_t __67__MSComposeAnalytics_sendAnalyticsSignal_threadIdentifier_isDraft___block_invoke(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0D3AB50], "sendSignal:toChannel:withUniqueStringID:withPayload:", a1[4], *MEMORY[0x1E0D3AAE8], a1[5], a1[6]);
}

@end
