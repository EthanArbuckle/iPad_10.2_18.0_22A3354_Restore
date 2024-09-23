@implementation EDCategoryPowerLog

+ (void)logStartCategorizationWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (categoryPowerLogIdentifier_onceToken != -1)
    dispatch_once(&categoryPowerLogIdentifier_onceToken, &__block_literal_global_9);
  v6[0] = CFSTR("eventType");
  v6[1] = CFSTR("reason");
  v7[0] = &unk_1E94E46A0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PPSSendTelemetry();

}

+ (void)logStopCategorizationWithReason:(int64_t)a3 count:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (categoryPowerLogIdentifier_onceToken != -1)
    dispatch_once(&categoryPowerLogIdentifier_onceToken, &__block_literal_global_9);
  v10[0] = &unk_1E94E46B8;
  v9[0] = CFSTR("eventType");
  v9[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  v9[2] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PPSSendTelemetry();

}

@end
