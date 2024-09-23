@implementation EnhancedLoggingStateController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[EnhancedLoggingStateController setInputs:](self, "setInputs:", a3, a4);
}

- (void)start
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004EC8;
  v4[3] = &unk_1000082A8;
  v4[4] = self;
  objc_msgSend(v3, "refreshWithCompletion:", v4);

}

- (void)finishWithStatusCode:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (a4)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController result](self, "result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController result](self, "result"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
      v11 = objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    }

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, ELSDefaultMetadata);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController result](self, "result"));
    objc_msgSend(v13, "setData:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController result](self, "result"));
  objc_msgSend(v14, "setStatusCode:", v15);

  -[EnhancedLoggingStateController setFinished:](self, "setFinished:", 1);
}

- (void)enrollWithFlush:(BOOL)a3 commit:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));
  v9 = objc_msgSend(v8, "status");

  v14 = (unint64_t)v9 < 2;
  if ((unint64_t)v9 >= 2)
  {
    v12 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000060AC();

    -[EnhancedLoggingStateController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_1000084A0, 0);
    v11 = 0;
  }
  else
  {
    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
      objc_msgSend(v10, "flush");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController formatNewQueueEntries:](self, "formatNewQueueEntries:", &v14));
    if (v14)
      -[EnhancedLoggingStateController updateEnhancedLoggingStateWithNewQueueEntries:commit:](self, "updateEnhancedLoggingStateWithNewQueueEntries:commit:", v11, v4);
  }

}

- (void)unenroll
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));
  v5 = objc_msgSend(v4, "status");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000052E8;
    v9[3] = &unk_100008310;
    v9[4] = self;
    objc_msgSend(v6, "transactionWithBlock:completion:", &stru_1000082E8, v9);

  }
  else
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000060D8();

    -[EnhancedLoggingStateController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_1000084D0, 0);
  }
}

- (id)formatNewQueueEntries:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController createQueueEntryInputDictionary:](self, "createQueueEntryInputDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i)));
        if (objc_msgSend(v7, "containsObject:", v15))
        {
          v16 = DiagnosticLogHandleForCategory(3);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100006104(v15, v17);

          -[EnhancedLoggingStateController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_1000084E8, 0);
          *a3 = 0;
LABEL_14:

          goto LABEL_15;
        }
        if (!*a3)
          goto LABEL_14;
        objc_msgSend(v8, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
  return v18;
}

- (id)createQueueEntryInputDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;

  v4 = ELSSubDefaultQueueEntryType;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ELSParameterPayload));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryExecuteAfterDuration));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryRetry));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ELSSubDefaultQueueEntryPlatform));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ELSWhitelist findEntryForParameterName:](ELSWhitelist, "findEntryForParameterName:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v7)
  {
    v32 = v8;
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parameterPayloads"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parameterPayloads"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v13));

      if (v18)
        objc_msgSend(v12, "addEntriesFromDictionary:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "specificationPayloads"));

    v7 = v13;
    v8 = v32;
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "specificationPayloads"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v7));

      if (v23)
        objc_msgSend(v12, "addEntriesFromDictionary:", v23);

    }
  }
  if (!v8)
  {
    v25 = 0.0;
    if (v9)
      goto LABEL_12;
LABEL_14:
    v26 = objc_msgSend(v10, "retry");
    goto LABEL_15;
  }
  objc_msgSend(v8, "doubleValue");
  v25 = v24;
  if (!v9)
    goto LABEL_14;
LABEL_12:
  v26 = objc_msgSend(v9, "BOOLValue");
LABEL_15:
  v27 = v26;
  v28 = objc_alloc((Class)ELSQueueEntry);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v12));
  v30 = objc_msgSend(v28, "initWithType:typeName:parameters:executeAfterDuration:retry:platform:", v11, v6, v29, v27, v33, v25);

  return v30;
}

- (void)updateEnhancedLoggingStateWithNewQueueEntries:(id)a3 commit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  EnhancedLoggingStateController *v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  if (!v4)
    goto LABEL_5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  if (objc_msgSend(v9, "count"))
  {

LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005940;
    v15[3] = &unk_100008338;
    v18 = v4;
    v16 = v6;
    v17 = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005AB8;
    v14[3] = &unk_100008310;
    v14[4] = self;
    objc_msgSend(v11, "transactionWithBlock:completion:", v15, v14);

    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "count");

  if (v10)
    goto LABEL_5;
  v12 = DiagnosticLogHandleForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100006198();

  -[EnhancedLoggingStateController finishWithStatusCode:metadata:](self, "finishWithStatusCode:metadata:", &off_100008500, 0);
LABEL_6:

}

- (id)aggregateMetadata
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[EnhancedLoggingStateController addDeviceSerialNumber:](self, "addDeviceSerialNumber:", v3);
  -[EnhancedLoggingStateController addDeviceType:](self, "addDeviceType:", v3);
  -[EnhancedLoggingStateController addEnrollmentTicketNumber:](self, "addEnrollmentTicketNumber:", v3);
  -[EnhancedLoggingStateController addAppleAccount:](self, "addAppleAccount:", v3);
  -[EnhancedLoggingStateController addServerSuppliedMetadata:](self, "addServerSuppliedMetadata:", v3);
  -[EnhancedLoggingStateController addPayload:](self, "addPayload:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v3));

  return v4;
}

- (void)addDeviceSerialNumber:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, ELSMetadataDeviceSerialNumber);

}

- (void)addDeviceType:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = (void *)MGCopyAnswer(CFSTR("ProductType"), 0);
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, ELSMetadataDeviceType);

}

- (void)addEnrollmentTicketNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Diagnostics"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("currentTicketNumber")));
    if (v5)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, ELSMetadataEnrollmentTicketNumber);

  }
}

- (void)addAppleAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v4 = objc_alloc_init((Class)ACAccountStore);
  v5 = v4;
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_primaryAppleAccount"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject username](v6, "username"));

      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[NSObject username](v7, "username"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, ELSMetadataUserAppleID);
      }
      else
      {
        v12 = DiagnosticLogHandleForCategory(3);
        v9 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_10000621C();
      }
    }
    else
    {
      v11 = DiagnosticLogHandleForCategory(3);
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000061F0();
    }

  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000061C4();
  }

}

- (void)addServerSuppliedMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metadata"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadata"));
    objc_msgSend(v8, "addEntriesFromDictionary:", v7);

  }
}

- (void)addPayload:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
  v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary queue](v5, "queue"));
  if (!v6)
  {
LABEL_9:

    goto LABEL_10;
  }
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v12, ELSDefaultQueue);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameterPayloads"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[EnhancedLoggingStateController inputs](self, "inputs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parameterPayloads"));
      -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v16, ELSParameterPayloadsDict);

    }
    v20 = 0;
    v17 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 1, &v20));
    v18 = (void *)v17;
    if (!v20 && v17)
    {
      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v17, 4);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, ELSMetadataPayload);

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (EnhancedLoggingStateInputs)inputs
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
