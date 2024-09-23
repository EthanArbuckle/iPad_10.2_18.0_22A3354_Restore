@implementation BatteryUsageAnalysisController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("com.apple.DiagnosticsService.Diagnostic-3743")));
  -[BatteryUsageAnalysisController setWorkingDirectory:](self, "setWorkingDirectory:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController workingDirectory](self, "workingDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("/archives/")));
  -[BatteryUsageAnalysisController setArchivesDirectory:](self, "setArchivesDirectory:", v8);

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[BatteryUsageAnalysisController isCancelled](self, "isCancelled") & 1) == 0
    && -[BatteryUsageAnalysisController createWorkingDirectories](self, "createWorkingDirectories"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController collectLogFile](self, "collectLogFile"));
    if ((-[BatteryUsageAnalysisController isCancelled](self, "isCancelled") & 1) == 0 && v3)
    {
      v7 = v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
      objc_msgSend(v5, "setFiles:", v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
      objc_msgSend(v6, "setStatusCode:", &off_100004340);

    }
  }
  -[BatteryUsageAnalysisController setFinished:](self, "setFinished:", 1);
}

- (void)teardown
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController workingDirectory](self, "workingDirectory"));
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

}

- (id)collectLogFile
{
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;

  v45 = 0;
  v46[0] = &v45;
  v46[1] = 0x3032000000;
  v46[2] = sub_10000204C;
  v46[3] = sub_10000205C;
  v47 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DSMutableArchive archive](DSMutableArchive, "archive"));
  objc_msgSend(v3, "setFormat:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController writeCurrentPowerLog](self, "writeCurrentPowerLog"));
  if (v4 && !-[BatteryUsageAnalysisController isCancelled](self, "isCancelled"))
  {
    v5 = v42;
    if (*((_BYTE *)v42 + 24))
    {
      v10 = (id *)(v46[0] + 40);
      v40 = *(id *)(v46[0] + 40);
      v11 = objc_msgSend(v3, "addURL:prefix:error:", v4, CFSTR("PLArchive"), &v40);
      objc_storeStrong(v10, v40);
      v5 = v42;
      if ((v11 & 1) == 0)
      {
        *((_BYTE *)v42 + 24) = 0;
        v12 = DiagnosticLogHandleForCategory(3);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100002D08((uint64_t)v46, v13, v14, v15, v16, v17, v18, v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedTestStatusHelper statusCodeForArchiveError:](DASharedTestStatusHelper, "statusCodeForArchiveError:", *(_QWORD *)(v46[0] + 40)));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
        objc_msgSend(v21, "setStatusCode:", v20);

        v5 = v42;
      }
    }
  }
  else
  {
    v5 = v42;
    *((_BYTE *)v42 + 24) = 0;
  }
  if (*((_BYTE *)v5 + 24)
    && (-[BatteryUsageAnalysisController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100002064;
    v36[3] = &unk_100004188;
    v36[4] = self;
    v37 = v3;
    v38 = &v45;
    v39 = &v41;
    -[BatteryUsageAnalysisController enumerateArchivedPowerLogsWithBlock:](self, "enumerateArchivedPowerLogsWithBlock:", v36);

  }
  if (*((_BYTE *)v42 + 24)
    && (-[BatteryUsageAnalysisController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v6 = DKTemporaryDirectoryURL();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (id *)(v46[0] + 40);
    obj = *(id *)(v46[0] + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "archiveAsTempFileWithTemplate:directory:suffix:error:", CFSTR("com.apple.behaviorscan.XXXXXXXX"), v7, 0, &obj));
    objc_storeStrong(v8, obj);

    if (v9)
    {
      if (!v4)
        goto LABEL_22;
      goto LABEL_21;
    }
    *((_BYTE *)v42 + 24) = 0;
    v22 = DiagnosticLogHandleForCategory(3);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100002C9C((uint64_t)v46, v23, v24, v25, v26, v27, v28, v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedTestStatusHelper statusCodeForArchiveError:](DASharedTestStatusHelper, "statusCodeForArchiveError:", *(_QWORD *)(v46[0] + 40)));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
    objc_msgSend(v31, "setStatusCode:", v30);

  }
  v9 = 0;
  if (v4)
  {
LABEL_21:
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    objc_msgSend(v32, "removeItemAtPath:error:", v33, 0);

  }
LABEL_22:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v9;
}

- (id)writeCurrentPowerLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  const __CFString *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ID_%@.PLSQL"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController workingDirectory](self, "workingDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v5));

  v32 = CFSTR("path");
  v33 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  v9 = PLQueryRegistered(32, CFSTR("SafeLogFile"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = DiagnosticLogHandleForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v27 = CFSTR("SafeLogFile");
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Powerlog] PLQueryRegistered[%@], input = %@, output = %@", buf, 0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("path")));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archiveLogFile:](self, "archiveLogFile:", v13));
    v15 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    -[NSObject removeItemAtPath:error:](v15, "removeItemAtPath:error:", v13, 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
    objc_msgSend(v16, "setStatusCode:", &off_100004358);

    v17 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100002DE4(v15, v18, v19, v20, v21, v22, v23, v24);
    v14 = 0;
  }

  return v14;
}

- (BOOL)createWorkingDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController workingDirectory](self, "workingDirectory"));
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archivesDirectory](self, "archivesDirectory"));
  v7 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
    objc_msgSend(v8, "setStatusCode:", &off_100004370);

    v9 = DiagnosticLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100002E14(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  return v7;
}

- (void)enumerateArchivedPowerLogsWithBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void (**v36)(id, void *);
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  const __CFString *v43;
  void *v44;

  v36 = (void (**)(id, void *))a3;
  v43 = CFSTR("folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archivesDirectory](self, "archivesDirectory"));
  v44 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));

  v6 = PLQueryRegistered(32, CFSTR("Archives"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = CFSTR("Archives");
    v39 = 2112;
    v40 = v5;
    v41 = 2112;
    v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Powerlog] PLQueryRegistered[%@], input = %@, output = %@", buf, 0x20u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archivesDirectory](self, "archivesDirectory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("folder")));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    v35 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archivesDirectory](self, "archivesDirectory"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "enumeratorAtPath:", v14));

    v16 = objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v15, "nextObject"));
    if (v16)
    {
      v17 = (void *)v16;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController archivesDirectory](self, "archivesDirectory"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v18, v17));

        buf[0] = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v21 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v19, buf);

        if (v21)
          v22 = buf[0] == 0;
        else
          v22 = 0;
        if (v22 && objc_msgSend(v17, "hasSuffix:", CFSTR(".PLSQL.gz")))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v19));
          v36[2](v36, v23);

        }
        v24 = objc_claimAutoreleasedReturnValue(-[NSObject nextObject](v15, "nextObject"));

        v17 = (void *)v24;
      }
      while (v24);
    }
    v25 = DiagnosticLogHandleForCategory(3);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[Powerlog] Gathering archived powerlogs completed successfully", buf, 2u);
    }

    v7 = v35;
  }
  else
  {
    v27 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100002E44(v15, v28, v29, v30, v31, v32, v33, v34);
  }

}

- (id)archiveLogFile:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  FILE *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  BatteryUsageAnalysisController *v15;
  const char *v16;
  int v17;
  int *v18;
  char *v19;
  id v20;
  FILE *v21;
  FILE *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  int v51;
  __int16 v52;
  char *v53;

  v4 = a3;
  v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR(".gz")));
  v5 = 6;
  v6 = "[Archive] Attempting to open file for reading.";
  v7 = "[ERROR] Cannot open read file [%@] for reading: (%d) %s";
  while (1)
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }

    v10 = objc_retainAutorelease(v4);
    v11 = fopen((const char *)objc_msgSend(v10, "UTF8String"), "r");
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 5.0);
    if (v11)
      break;
    v12 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v6;
      v15 = self;
      v16 = v7;
      v17 = *__error();
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)buf = 138412802;
      v49 = v4;
      v50 = 1024;
      v51 = v17;
      v7 = v16;
      self = v15;
      v6 = v14;
      v52 = 2080;
      v53 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v7, buf, 0x1Cu);
    }

    if ((unint64_t)--v5 <= 1)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
      objc_msgSend(v34, "setStatusCode:", &off_1000043B8);

      v35 = 0;
      v36 = v47;
      goto LABEL_21;
    }
  }
  v36 = v47;
  v20 = objc_retainAutorelease(v47);
  v21 = fopen((const char *)objc_msgSend(v20, "UTF8String"), "w");
  if (!v21)
  {
    v37 = DiagnosticLogHandleForCategory(3);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_100002E74((uint64_t)v4, v38, v39, v40, v41, v42, v43, v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
    objc_msgSend(v45, "setStatusCode:", &off_1000043A0);

    goto LABEL_17;
  }
  v22 = v21;
  v23 = CPFileCompressionZDeflate(v11, v21, 3);
  v24 = DiagnosticLogHandleForCategory(3);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if (v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100002ED8((uint64_t)v4, v26, v27, v28, v29, v30, v31, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryUsageAnalysisController result](self, "result"));
    objc_msgSend(v33, "setStatusCode:", &off_100004388);

    fclose(v22);
LABEL_17:
    fclose(v11);
    v35 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[Archive] Archive created successfully for file: %@", buf, 0xCu);
  }

  fclose(v22);
  fclose(v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20));
LABEL_21:

  return v35;
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (void)setWorkingDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_workingDirectory, a3);
}

- (NSString)archivesDirectory
{
  return self->_archivesDirectory;
}

- (void)setArchivesDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_archivesDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivesDirectory, 0);
  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end
