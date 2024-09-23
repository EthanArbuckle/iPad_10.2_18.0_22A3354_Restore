@implementation SGDPowerLog

+ (void)startDissectionOfMessage:(id)a3 inContext:(unint64_t)a4
{
  logDissectionEvent(1, a3, a4);
}

+ (void)endDissectionOfMessage:(id)a3 inContext:(unint64_t)a4
{
  logDissectionEvent(0, a3, a4);
}

+ (void)logPrewarmWithLastPrewarmTime:(double)a3
{
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "Pre-warming suggestd", v10, 2u);
  }

  v11 = CFSTR("secondsSinceLast");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  if (a3 == 0.0)
  {
    v7 = -1.0;
  }
  else
  {
    v4 = objc_opt_new();
    -[NSObject timeIntervalSinceReferenceDate](v4, "timeIntervalSinceReferenceDate");
    v7 = v6 - a3;
  }
  objc_msgSend(v5, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 != 0.0)
  PLLogRegisteredEvent();

}

+ (void)startIngestOfMessages:(unint64_t)a3
{
  logIngestEvent(1, a3);
}

+ (void)endIngestOfMessages:(unint64_t)a3
{
  logIngestEvent(0, a3);
}

+ (void)pluginStartSetup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

+ (void)pluginEndSetup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

+ (void)pluginStartProcessingSearchableItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

+ (void)pluginEndProcessingSearchableItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

+ (void)pluginStartDeletion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

+ (void)pluginEndDeletion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("plugin");
  v7[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

@end
