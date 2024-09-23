@implementation ICSCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int v13;
  unsigned int v14;

  v7 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009EF04;
  v11[3] = &unk_1002850B0;
  v13 = a4;
  v14 = a5;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v8, &v10);

  objc_msgSend(a1, "simulateCrashReportWithReason:pid:code:", v9, v6, v5);
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v4, &v6);

  objc_msgSend(a1, "simulateCrashReportWithReason:pid:code:", v5, getpid(), 14593455);
}

@end
