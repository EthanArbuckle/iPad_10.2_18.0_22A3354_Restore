@implementation DADiagnosticsSessionAvailability

- (void)checkAvailabilityWithReply:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  xpc_transaction_interrupt_clean_exit();
  objc_initWeak(&location, self);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10000CE18;
  v9[4] = sub_10000CE40;
  v10 = objc_msgSend(v4, "copy");
  global_queue = dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE48;
  block[3] = &unk_100132C40;
  objc_copyWeak(&v8, &location);
  block[4] = v9;
  dispatch_sync(v6, block);

  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);

  objc_destroyWeak(&location);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 response:(id)a4
{
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:response:](self, "checkAvailabilityWithTicketNumber:timeout:response:", a3, a4, 7.0);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 response:(id)a5
{
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:](self, "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:", a3, 1, a5, a4);
}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 response:(id)a6
{
  _BOOL8 v6;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000D1DC;
  v11[3] = &unk_100132C68;
  v12 = a6;
  v10 = v12;
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:completion:](self, "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:completion:", a3, v6, v11, a4);

}

- (void)checkAvailabilityWithTicketNumber:(id)a3 timeout:(double)a4 exitWhenDone:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  double v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  global_queue = dispatch_get_global_queue(21, 0);
  v13 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D2C8;
  block[3] = &unk_100132CB8;
  block[4] = self;
  v17 = v10;
  v19 = a4;
  v18 = v11;
  v20 = a5;
  v14 = v11;
  v15 = v10;
  dispatch_async(v13, block);

}

- (void)rebootIntoCheckerBoard
{
  if (-[DADiagnosticsSessionAvailability isInternalInstall](self, "isInternalInstall"))
    +[CBSUtilities rebootToCheckerBoard](CBSUtilities, "rebootToCheckerBoard");
}

- (void)setASTServerURL:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (-[DADiagnosticsSessionAvailability isInternalInstall](self, "isInternalInstall"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
    v5 = objc_msgSend(off_100169C68, "copy");
    objc_msgSend(v4, "_writeNVRamVariable:value:", v5, v6);

  }
}

- (void)clearASTServerURL
{
  id v2;
  id v3;

  if (-[DADiagnosticsSessionAvailability isInternalInstall](self, "isInternalInstall"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[DANvramUtil sharedInstance](DANvramUtil, "sharedInstance"));
    v2 = objc_msgSend(off_100169C68, "copy");
    objc_msgSend(v3, "_clearNVRamVariable:", v2);

  }
}

- (id)getSessionID
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  void **v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t, int);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  intptr_t v27;
  __int16 v28;
  int v29;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000D9D0;
  v19 = &unk_100132CE0;
  v21 = &v22;
  v3 = dispatch_semaphore_create(0);
  v20 = v3;
  -[DADiagnosticsSessionAvailability checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:](self, "checkAvailabilityWithTicketNumber:timeout:exitWhenDone:response:", 0, 0, &v16, 30.0);
  v4 = DiagnosticLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for response to availability check", buf, 2u);
  }

  v6 = dispatch_time(0, 30000000000);
  v7 = dispatch_semaphore_wait(v3, v6);
  v8 = DiagnosticLogHandleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v23 + 24);
    *(_DWORD *)buf = 134218240;
    v27 = v7;
    v28 = 1024;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finished waiting for response to availability check. timedOut: %ld validSession: %d", buf, 0x12u);
  }

  if (*((_BYTE *)v23 + 24))
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.Diagnostics"));
    v11 = (void *)CFPreferencesCopyAppValue(CFSTR("InCurrentSession"), CFSTR("com.apple.Diagnostics"));
    if ((objc_msgSend(v11, "BOOLValue", v16, v17, v18, v19) & 1) != 0)
      v12 = CFSTR("IN_CURRENT_SESSION");
    else
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));

  }
  else
  {
    v12 = 0;
  }
  v13 = DiagnosticLogHandleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = (intptr_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session status: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (BOOL)isInternalInstall
{
  if (qword_10016E858 != -1)
    dispatch_once(&qword_10016E858, &stru_100132D00);
  return byte_10016E850;
}

- (void)checkEnhancedLoggingStateWithReply:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DB88;
  v6[3] = &unk_100132D28;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "refreshWithCompletion:", v6);

}

- (id)serialNumbers
{
  void *v2;
  NSMutableSet *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  dispatch_semaphore_t v20;
  uint8_t buf[4];
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v3 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", objc_opt_class(0x100163000), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "addObject:", objc_opt_class(DADeviceObserverAccessories));
  v5 = +[CBSUtilities isCheckerBoardActive](CBSUtilities, "isCheckerBoardActive");
  if ((BYSetupAssistantNeedsToRun() & 1) != 0
    || ((BYSetupAssistantHasCompletedInitialRun() ^ 1 | v5) & 1) != 0)
  {
    v6 = DiagnosticLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Only reporting serial number for local device and physically connected accessories because Buddy is not finished", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(v4, "addObject:", objc_opt_class(DADeviceObserverWatch));
    objc_msgSend(v4, "addObject:", objc_opt_class(DADeviceObserverAirpods));
  }
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DADeviceObserverAggregator aggregatorWithObserverClasses:](DADeviceObserverAggregator, "aggregatorWithObserverClasses:", v4));
  v10 = dispatch_semaphore_create(0);
  v11 = DiagnosticLogHandleForCategory(10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Discovering devices…", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000DE60;
  v18[3] = &unk_100132D78;
  v13 = v2;
  v19 = v13;
  v20 = v10;
  v14 = v10;
  objc_msgSend(v9, "discoverAllDevicesWithCompletionHandler:", v18);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v8);
  v15 = DiagnosticLogHandleForCategory(10);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Discovery complete, found: %@", buf, 0xCu);
  }

  return v13;
}

@end
