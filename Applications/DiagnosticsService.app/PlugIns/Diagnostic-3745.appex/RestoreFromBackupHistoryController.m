@implementation RestoreFromBackupHistoryController

- (void)start
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)DSGeneralLogCollector), "initWithLogIDs:", &off_1000042F8);
  if ((-[RestoreFromBackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
    -[RestoreFromBackupHistoryController parseLogsWithCollector:](self, "parseLogsWithCollector:", v3);
  -[RestoreFromBackupHistoryController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[9];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100003240;
  v34 = sub_100003250;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100003240;
  v28 = sub_100003250;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003258;
  v15[3] = &unk_100004128;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v24;
  v15[7] = &v16;
  v15[8] = &v30;
  objc_msgSend(v4, "enumerateLogLinesWithBlock:", v15);
  if ((-[RestoreFromBackupHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
    objc_msgSend(v5, "setStatusCode:", &off_100004310);

    if (*((_BYTE *)v21 + 24))
    {
      if (!v25[5])
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
        objc_msgSend(v6, "setStatusCode:", &off_100004328);
        goto LABEL_7;
      }
      if (*((_BYTE *)v17 + 24))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
        objc_msgSend(v6, "setStatusCode:", &off_100004340);
LABEL_7:

      }
    }
    v36[0] = CFSTR("lastBackupRestoreEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31[5], "dictionary"));
    v8 = dictionaryOrNull(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v36[1] = CFSTR("lastSuccessfulBackupRestoreEvent");
    v37[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "dictionary"));
    v11 = dictionaryOrNull(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v37[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RestoreFromBackupHistoryController result](self, "result"));
    objc_msgSend(v14, "setData:", v13);

  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

@end
