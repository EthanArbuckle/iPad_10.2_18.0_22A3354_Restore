@implementation RunLoop

- (BOOL)performStartupWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (void)runUntilIdleExit
{
  NSObject *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v3, &stru_1000146D8);
  dispatch_resume(v3);
  v11 = 0;
  v4 = -[RunLoop performStartupWithError:](self, "performStartupWithError:", &v11);
  v5 = v11;
  v6 = v5;
  if (!v4 || v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to startup daemon. Error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    -[RunLoop _run](self, "_run");
  }

}

- (void)_run
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;

  v3 = objc_autoreleasePoolPush();
  if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) >= 2)
  {
    do
    {
      objc_autoreleasePoolPop(v3);
      v3 = objc_autoreleasePoolPush();
    }
    while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) > 1);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](APLogConfig, "sharedDaemonConfig"));
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class(self);
    v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping for idle-exit", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

@end
