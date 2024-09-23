@implementation DABackupRestoreEvent

- (DABackupRestoreEvent)initWithDate:(id)a3 eventSubType:(id)a4 successfulBackup:(BOOL)a5 eventCode:(int64_t)a6
{
  id v11;
  id v12;
  DABackupRestoreEvent *v13;
  DABackupRestoreEvent *v14;
  NSString *engine;
  const __CFString *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DABackupRestoreEvent;
  v13 = -[DABackupRestoreEvent init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a3);
    v14->_backupRestoreEventCode = a6;
    v14->_successfulBackup = a5;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("iTunesBackup")) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", CFSTR("iTunesRestore")))
    {
      engine = v14->_engine;
      v16 = CFSTR("iTunes");
LABEL_8:
      v14->_engine = &v16->isa;

      goto LABEL_9;
    }
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("iCloudBackup")) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", CFSTR("iCloudRestore")))
    {
      engine = v14->_engine;
      v16 = CFSTR("iCloud");
      goto LABEL_8;
    }
  }
LABEL_9:

  return v14;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];

  v17[0] = CFSTR("date");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "formatterWithType:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v5));
  v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18[0] = v8;
  v17[1] = CFSTR("engine");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent engine](self, "engine"));
  v10 = stringOrNull(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v18[1] = v11;
  v17[2] = CFSTR("code");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[DABackupRestoreEvent backupRestoreEventCode](self, "backupRestoreEventCode")));
  v13 = numberOrNull(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v18[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

  return v15;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (int64_t)backupRestoreEventCode
{
  return self->_backupRestoreEventCode;
}

- (void)setBackupRestoreEventCode:(int64_t)a3
{
  self->_backupRestoreEventCode = a3;
}

- (BOOL)successfulBackup
{
  return self->_successfulBackup;
}

- (void)setSuccessfulBackup:(BOOL)a3
{
  self->_successfulBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
