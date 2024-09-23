@implementation MTDistributedNotificationPoster

+ (BOOL)_shouldNotifyForTrigger:(id)a3
{
  return objc_msgSend(a3, "isForAlert");
}

- (void)postNotificationForScheduledAlarm:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  MTDistributedNotificationPoster *v17;
  __int16 v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "_shouldNotifyForTrigger:", v9);

  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "scheduleable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alarmIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("MTAlarmID");
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MTLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "alarmID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ posting distributed notification for alarm: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.mobiletimer.MTAlarmDidFireNotification"), 0, v12, 1);

  }
  v7[2](v7);

}

- (void)postNotificationForScheduledTimer:(id)a3 completionBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  MTDistributedNotificationPoster *v14;
  __int16 v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(a3, "scheduleable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timerIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("MTTimerID");
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "timerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ posting distributed notification for timer: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.mobiletimer.MTTimerDidFireNotification"), 0, v9, 1);

  v6[2](v6);
}

@end
