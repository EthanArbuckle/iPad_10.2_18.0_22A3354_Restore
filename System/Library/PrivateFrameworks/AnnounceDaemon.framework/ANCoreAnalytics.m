@implementation ANCoreAnalytics

- (void)send:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForDefault:", *MEMORY[0x1E0CF7BE8]);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(CFSTR("com.apple.announce."), "stringByAppendingString:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = v6;
    AnalyticsSendEventLazy();

  }
  else
  {
    ANLogHandleCoreAnalytics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v13 = &stru_1E93913D0;
      v14 = 2080;
      v15 = "-[ANCoreAnalytics send:withPayload:]";
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEBUG, "%@%s CA Events Disabled.", buf, 0x16u);
    }

    ANLogHandleCoreAnalytics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v13 = &stru_1E93913D0;
      v14 = 2080;
      v15 = "-[ANCoreAnalytics send:withPayload:]";
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEBUG, "%@%s CA Ignored event name: %@, event payload: %@", buf, 0x2Au);
    }
  }

}

id __36__ANCoreAnalytics_send_withPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
