@implementation BackupHistoryController

- (void)start
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)DSGeneralLogCollector), "initWithLogIDs:", &off_1000042F8);
  if ((-[BackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
    -[BackupHistoryController parseLogsWithCollector:](self, "parseLogsWithCollector:", v3);
  -[BackupHistoryController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000030EC;
  v25 = sub_1000030FC;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000030EC;
  v19 = sub_1000030FC;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003104;
  v14[3] = &unk_100004128;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v21;
  objc_msgSend(v4, "enumerateLogLinesWithBlock:", v14);
  if ((-[BackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v22[5])
    {
      if (v16[5])
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
        objc_msgSend(v5, "setStatusCode:", &off_100004340);
      }
      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
        objc_msgSend(v5, "setStatusCode:", &off_100004328);
      }
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
      objc_msgSend(v5, "setStatusCode:", &off_100004310);
    }

    v27[0] = CFSTR("lastBackupEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "dictionary"));
    if (v6)
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "dictionary"));
    else
      v7 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v8 = (void *)v7;
    v27[1] = CFSTR("lastSuccessfulBackupEvent");
    v28[0] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "dictionary"));
    if (v9)
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "dictionary"));
    else
      v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11 = (void *)v10;
    v28[1] = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BackupHistoryController result](self, "result"));
    objc_msgSend(v13, "setData:", v12);

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
}

@end
