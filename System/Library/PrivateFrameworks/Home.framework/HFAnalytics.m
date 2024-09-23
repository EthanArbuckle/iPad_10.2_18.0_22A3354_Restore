@implementation HFAnalytics

uint64_t __26__HFAnalytics__sendEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "payload");
}

+ (void)sendEvent:(unint64_t)a3 withData:(id)a4
{
  objc_class *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (objc_class *)objc_msgSend(a1, "eventClassForEventType:", a3);
  if (v6)
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithData:", v8);
    objc_msgSend(a1, "_sendEvent:", v7);

  }
}

+ (Class)eventClassForEventType:(unint64_t)a3
{
  _QWORD *v3;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__HFAnalytics_eventClassForEventType___block_invoke;
  v6[3] = &__block_descriptor_40_e5__8__0l_0;
  v6[4] = a3;
  v3 = __38__HFAnalytics_eventClassForEventType___block_invoke(v6);
  if ((objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    return (Class)v3;
  NSStringFromClass((Class)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Invalid analytics event class: %@"), v5);

  return (Class)0;
}

_QWORD *__38__HFAnalytics_eventClassForEventType___block_invoke(_QWORD *a1)
{
  if (a1[4] <= 0x38uLL)
  {
    objc_opt_class();
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (void)_sendEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Sending analytics event: %@", buf, 0xCu);
  }

  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  v6 = v3;
  AnalyticsSendEventLazy();

}

+ (id)eventNameForEventType:(unint64_t)a3
{
  if (a3 - 1 > 0x37)
    return CFSTR("com.apple.Home.AppForegroundDuration");
  else
    return off_1EA73C240[a3 - 1];
}

+ (void)sendEvent:(unint64_t)a3
{
  objc_msgSend(a1, "sendEvent:withData:", a3, MEMORY[0x1E0C9AA70]);
}

@end
