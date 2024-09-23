@implementation EnhancedCellularCallPerformanceController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  unsigned int v10;
  __int16 v11;
  int v12;

  CFPreferencesAppSynchronize(CFSTR("com.apple.Diagnostics"));
  keyExistsAndHasValidFormat = 0;
  -[EnhancedCellularCallPerformanceController setCopyForSyncing:](self, "setCopyForSyncing:", CFPreferencesGetAppBooleanValue(CFSTR("Diagnostic-4359.CopyForSyncing"), CFSTR("com.apple.Diagnostics"), &keyExistsAndHasValidFormat) != 0);
  if (!keyExistsAndHasValidFormat)
    -[EnhancedCellularCallPerformanceController setCopyForSyncing:](self, "setCopyForSyncing:", 0);
  v5 = DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[EnhancedCellularCallPerformanceController copyForSyncing](self, "copyForSyncing");
    *(_DWORD *)buf = 67109376;
    v10 = v7;
    v11 = 1024;
    v12 = keyExistsAndHasValidFormat;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Copying for syncing: %d, exists: %d", buf, 0xEu);
  }

}

- (void)start
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedCellularCallPerformanceController result](self, "result"));
  objc_msgSend(v3, "setStatusCode:", &off_100004240);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002B44;
  v4[3] = &unk_100004168;
  v4[4] = self;
  WISServerConsolidateDeviceDiagnostics(0, &_dispatch_main_q, v4);
}

- (id)_extractFilePaths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  _BYTE v56[128];

  v4 = a3;
  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kWisDiagnosticsFileArray));
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedCellularCallPerformanceController result](self, "result"));
    objc_msgSend(v18, "setStatusCode:", &off_100004288);

    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000034B0(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_24;
  }
  v6 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedCellularCallPerformanceController result](self, "result"));
    objc_msgSend(v28, "setStatusCode:", &off_1000042A0);

    v29 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100003510(v20, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_24;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedCellularCallPerformanceController result](self, "result"));
    objc_msgSend(v37, "setStatusCode:", &off_1000042B8);

    v38 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1000034E0(v20, v39, v40, v41, v42, v43, v44, v45);
LABEL_24:

    v7 = v49;
    v49 = 0;
    goto LABEL_25;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (!v8)
  {
LABEL_25:

    goto LABEL_26;
  }
  v9 = v8;
  v47 = v5;
  v48 = v4;
  v10 = *(_QWORD *)v51;
  v11 = 1;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v51 != v10)
        objc_enumerationMutation(v7);
      v13 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
      v14 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v15 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
        objc_msgSend(v49, "addObject:", v15);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedCellularCallPerformanceController result](self, "result"));
        objc_msgSend(v16, "setStatusCode:", &off_1000042D0);

        v17 = DiagnosticLogHandleForCategory(3);
        v15 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "ERROR item in array is not an NSString: %@", buf, 0xCu);
        }
        v11 = 0;
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  }
  while (v9);

  if ((v11 & 1) == 0)
  {
    v7 = v49;
    v49 = 0;
    v5 = v47;
    v4 = v48;
    goto LABEL_25;
  }
  v5 = v47;
  v4 = v48;
LABEL_26:

  return v49;
}

- (BOOL)copyForSyncing
{
  return self->_copyForSyncing;
}

- (void)setCopyForSyncing:(BOOL)a3
{
  self->_copyForSyncing = a3;
}

@end
