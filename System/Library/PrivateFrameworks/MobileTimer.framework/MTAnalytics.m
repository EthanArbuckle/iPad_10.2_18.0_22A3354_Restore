@implementation MTAnalytics

+ (void)submitEvent:(id)a3 eventParameters:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __43__MTAnalytics_submitEvent_eventParameters___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)incrementEventCount:(id)a3
{
  objc_msgSend(a1, "submitEvent:eventParameters:", a3, MEMORY[0x1E0C9AA70]);
}

+ (void)sendCriticalEvent:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") && (unint64_t)objc_msgSend(v4, "length") <= 0x1F3)
  {
    v6 = CFSTR("MTCriticalEventMessage");
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "submitEvent:eventParameters:", CFSTR("com.apple.MobileTimer.critical"), v5);

  }
}

@end
