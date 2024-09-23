@implementation IMAutomationBatchMessageOperations

- (id)sendMessagesfromReplayDatabase:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) != 0)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replayMessagesFromDatabasePath:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested to replay a database that does not exist at path: %@"), v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a5)
    {
      v14 = v10;
      v15[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.messages.automation"), 1, v12);

    }
  }

  return 0;
}

- (id)beginRecordingMessagesToReplayDatabase:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginRecordingMessagesToReplayDatabase:", v4);

  return 0;
}

- (id)stopRecordingDatabaseError:(id *)a3
{
  void *v3;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRecordingMessagesReplayDatabase");

  return 0;
}

@end
