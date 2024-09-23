@implementation SecurityAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (qword_25414BF70 != -1)
    dispatch_once(&qword_25414BF70, &unk_24FFB5FE8);
  return (id)qword_25414BF78;
}

+ (void)sendMetricWithEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  BOOL v17;

  v13 = a3;
  v7 = a5;
  if (objc_msgSend_permittedToSendMetrics(v13, v8, v9))
  {
    objc_msgSend_queue(v13, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230F30BA0;
    block[3] = &unk_24FFB6010;
    v15 = v13;
    v17 = a4;
    v16 = v7;
    dispatch_sync(v12, block);

  }
}

@end
