@implementation AppCrashHistoryController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[AppCrashHistoryController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)DSGeneralLogCollector);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logIds"));
  v6 = objc_msgSend(v3, "initWithLogIDs:", v5);

  if ((-[AppCrashHistoryController isCancelled](self, "isCancelled") & 1) == 0)
    -[AppCrashHistoryController parseLogsWithCollector:](self, "parseLogsWithCollector:", v6);
  -[AppCrashHistoryController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  double v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id location;
  void *v32;

  v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100002514;
  v26[3] = &unk_100004210;
  objc_copyWeak(&v30, &location);
  v7 = v4;
  v27 = v7;
  v8 = v6;
  v28 = v8;
  v9 = v5;
  v29 = v9;
  objc_msgSend(v22, "enumerateLogLinesWithBlock:", v26);
  if ((-[AppCrashHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DSGeneralLogCollector latestUserLog](DSGeneralLogCollector, "latestUserLog"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "restoreDate"));
    objc_msgSend(v11, "timeIntervalSinceNow");
    v13 = v12;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100002738;
    v23[3] = &unk_100004238;
    v25 = v13 / -86400.0;
    v23[4] = self;
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = v14;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (objc_msgSend(v14, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
      objc_msgSend(v16, "setStatusCode:", &off_100004450);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", &stru_100004398, 1));
      v32 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedArrayUsingDescriptors:", v18));

      v15 = (void *)v19;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
      objc_msgSend(v17, "setStatusCode:", &off_100004468);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v20, "setValue:forKey:", v15, CFSTR("frequentlyCrashingApps"));
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v20, "setValue:forKey:", v9, CFSTR("panicCounts"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController result](self, "result"));
    objc_msgSend(v21, "setData:", v20);

  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (id)userFriendlyAppNameForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_11;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= objc_msgSend(CFSTR("com.apple."), "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringToIndex:", objc_msgSend(CFSTR("com.apple."), "length")));
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.")) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "whitelist"));
      if (!objc_msgSend(v9, "count"))
      {

LABEL_11:
        v13 = 0;
        goto LABEL_12;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController inputs](self, "inputs"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "whitelist"));
      v12 = objc_msgSend(v11, "containsObject:", v5);

      if (!v12)
        goto LABEL_11;
    }
    else
    {

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppCrashHistoryController appNameForBundleID:](self, "appNameForBundleID:", v5));
LABEL_12:

  return v13;
}

- (id)appNameForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord bundleRecordWithApplicationIdentifier:error:](LSApplicationRecord, "bundleRecordWithApplicationIdentifier:error:", v3, &v10));
  v5 = v10;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedName"));
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100002A40((uint64_t)v3, (uint64_t)v5, v8);

    v6 = 0;
  }

  return v6;
}

- (AppCrashHistoryInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
