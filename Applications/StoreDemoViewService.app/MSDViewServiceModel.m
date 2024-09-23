@implementation MSDViewServiceModel

+ (id)sharedInstance
{
  if (qword_100012C38 != -1)
    dispatch_once(&qword_100012C38, &stru_10000C4B0);
  return (id)qword_100012C30;
}

- (MSDViewServiceModel)init
{
  MSDViewServiceModel *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  MSDViewServiceModel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSDViewServiceModel;
  v2 = -[MSDViewServiceModel init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](MSDKManagedDevice, "sharedInstance"));
    objc_msgSend(v3, "setDelegate:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[MSDViewServiceModel setErrors:](v2, "setErrors:", v4);

    LODWORD(v5) = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
    -[MSDViewServiceModel setProgress:](v2, "setProgress:", v6);

    -[MSDViewServiceModel setShowCancelButton:](v2, "setShowCancelButton:", 0);
    v7 = v2;
  }

  return v2;
}

- (id)errorMessageFromErrors
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  NSObject *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  __CFString *v30;
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = &stru_10000C610;
      v9 = *(_QWORD *)v26;
      do
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedFailureReason"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
          v15 = objc_msgSend(v12, "code");
          v16 = v15;
          if (v13)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedFailureReason"));
            v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(0x%lx) - %@\n"), v14, v16, v17));

            v7 = (void *)v18;
          }
          else
          {
            v17 = v7;
            v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(0x%lx)\n"), v14, v15));
          }

          v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v7));
          v10 = (char *)v10 + 1;
          v11 = v8;
        }
        while (v6 != v10);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v6);

    }
    else
    {
      v8 = &stru_10000C610;
    }

    v21 = sub_10000262C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Full message is now: %{public}@", buf, 0xCu);
    }

    v20 = v8;
    v19 = v20;
  }
  else
  {
    v19 = 0;
    v20 = &stru_10000C610;
  }

  return v19;
}

- (void)didReceiveError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errors](self, "errors"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDViewServiceModel errorMessageFromErrors](self, "errorMessageFromErrors"));
  -[MSDViewServiceModel setErrorMessage:](self, "setErrorMessage:", v6);

}

- (void)didReceiveProgress:(int64_t)a3
{
  id v5;
  NSObject *v6;
  double v7;
  void *v8;
  int v9;
  int64_t v10;

  v5 = sub_10000262C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received progress: %ld", (uint8_t *)&v9, 0xCu);
  }

  if (a3 >= 1)
  {
    *(float *)&v7 = (float)a3 / 100.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    -[MSDViewServiceModel setProgress:](self, "setProgress:", v8);

  }
}

- (void)operationCompleted
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Operation completed, informing the view controller.", v5, 2u);
  }

  -[MSDViewServiceModel setErrorToReport:](self, "setErrorToReport:", 0);
}

- (void)operationFailed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = sub_10000262C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Operation failed, informing the view controller.", v7, 2u);
  }

  -[MSDViewServiceModel setErrorToReport:](self, "setErrorToReport:", v4);
}

- (void)didReceiveAllowCancel:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = sub_10000262C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received allow cancel status: %d", (uint8_t *)v7, 8u);
  }

  -[MSDViewServiceModel setShowCancelButton:](self, "setShowCancelButton:", v3);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)errorToReport
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setErrorToReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)progress
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
