@implementation IMDCKBackupControllerProxy

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14D47EC;
  block[3] = &unk_1E9227F30;
  block[4] = a1;
  if (qword_1ED935ED8 != -1)
    dispatch_once(&qword_1ED935ED8, block);
  return (id)qword_1ED935DC8;
}

- (void)setFirstSyncDateToNow
{
  id v2;

  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFirstSyncDateToNow");

}

- (void)toggleiCloudBackupsIfNeeded:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleiCloudBackupsIfNeeded:", v3);

}

- (void)sendDeviceIDToCloudKitWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDCKBackupController sharedInstance](IMDCKBackupController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendDeviceIDToCloudKitWithCompletion:", v3);

}

@end
