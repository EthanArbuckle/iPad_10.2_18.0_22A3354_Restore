@implementation AVTSyncSchedulingAuthority

- (AVTSyncSchedulingAuthority)initWithLogger:(id)a3
{
  id v5;
  AVTSyncSchedulingAuthority *v6;
  AVTSyncSchedulingAuthority *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSyncSchedulingAuthority;
  v6 = -[AVTSyncSchedulingAuthority init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logger, a3);

  return v7;
}

- (BOOL)importRequired
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  void *v8;

  AVTUISyncSuccessfulImportDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "timeIntervalSinceDate:", v3),
        v6 = 86400.0 - v5,
        v4,
        v6 >= 0.0))
  {
    -[AVTSyncSchedulingAuthority logger](self, "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logNotImportingOnLaunchWithRemainingTime:", v6);

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)importDidCompleteSuccessfully
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  AVTUISyncSetSuccessfulImportDate(v2);

}

- (void)exportDidCompleteSuccessfully
{
  AVTUISyncSetExportRequired(0);
}

- (void)didReceivePushNotification
{
  AVTUISyncSetSuccessfulImportDate(0);
}

- (void)didResetSync
{
  AVTUISyncSetSuccessfulImportDate(0);
  AVTUISyncSetExportRequired(1);
}

- (void)madeLocalChanges
{
  AVTUISyncSetExportRequired(1);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
