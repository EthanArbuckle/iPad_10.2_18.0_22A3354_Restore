@implementation DABackupRestoreLogLine

- (NSString)eventSubType
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine fields](self, "fields"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 < 3)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine fields](self, "fields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 2));

  }
  return (NSString *)v6;
}

- (int64_t)backupCode
{
  return (int)-[DABackupRestoreLogLine integerFromFieldAtIndex:](self, "integerFromFieldAtIndex:", 3);
}

- (BOOL)didSucceed
{
  return -[DABackupRestoreLogLine backupCode](self, "backupCode") == 0;
}

- (int64_t)backupRestoreEventType
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](self, "eventSubType"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("iCloudBackup")))
  {

    return 1000;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](self, "eventSubType"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("iTunesBackup"));

  if (v5)
    return 1000;
  return 1001;
}

@end
