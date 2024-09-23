@implementation LPStatistics

+ (void)recordEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "type") || objc_msgSend(v4, "type") == 4)
    objc_msgSend(a1, "recordMetadataFetchEvent:", v4);

}

+ (void)recordMetadataFetchEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9[0] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("specialization");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "specialization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("duration");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "duration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

@end
