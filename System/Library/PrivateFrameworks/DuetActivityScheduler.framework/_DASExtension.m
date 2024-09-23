@implementation _DASExtension

- (_DASExtension)init
{
  _DASExtension *v2;
  os_log_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASExtension;
  v2 = -[_DASExtension init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.duetactivityscheduler", "extension");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

  }
  return v2;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DASExtension log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Beginning request with extension context %@", (uint8_t *)&v6, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_DASExtension setContext:](self, "setContext:", v4);

}

- (void)_activityCompletedWithStatus:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  OS_os_transaction *transaction;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[_DASExtension log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Extension is finished.", buf, 2u);
  }

  -[_DASExtension context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "hostContextWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7 || v8)
  {
    -[_DASExtension log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1B0DF4000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get remote context with error %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v7, "activityCompletedWithStatus:", v3);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)runner:(id)a3 performActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  _DWORD v21[7];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_DASExtension log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    *(_QWORD *)v21 = v7;
    _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, "Extension performing activity: %@", (uint8_t *)&v20, 0xCu);
  }

  v9 = (void *)os_transaction_create();
  -[_DASExtension setTransaction:](self, "setTransaction:", v9);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASExtension setStartTime:](self, "setStartTime:", v10);

  -[_DASExtension setRunner:](self, "setRunner:", v6);
  v11 = (void *)objc_msgSend(v7, "copy");
  -[_DASExtension setActivity:](self, "setActivity:", v11);

  -[_DASExtension runner](self, "runner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "prepareForActivity:", v7);

  if (v13)
  {
    -[_DASExtension runner](self, "runner");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject start](v14, "start");
  }
  else
  {
    -[_DASExtension log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DASExtension runner:performActivity:].cold.1((uint64_t)v6, v7, v14);
    v15 = 3;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", self->_startTime);
  v18 = v17;
  -[_DASExtension log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109376;
    v21[0] = v15;
    LOWORD(v21[1]) = 2048;
    *(_QWORD *)((char *)&v21[1] + 2) = v18;
    _os_log_impl(&dword_1B0DF4000, v19, OS_LOG_TYPE_DEFAULT, "Extension complete (%hhu), time elapsed: %f s", (uint8_t *)&v20, 0x12u);
  }

  -[_DASExtension _activityCompletedWithStatus:](self, "_activityCompletedWithStatus:", v15);
}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  -[_DASExtension log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Request for extension to finish early.", v5, 2u);
  }

  -[_DASExtension runner](self, "runner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[_DASExtension _activityCompletedWithStatus:](self, "_activityCompletedWithStatus:", 2);
}

- (_DASExtensionRemoteContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_DASExtensionRunner)runner
{
  return self->_runner;
}

- (void)setRunner:(id)a3
{
  objc_storeStrong((id *)&self->_runner, a3);
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_runner, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)runner:(NSObject *)a3 performActivity:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B0DF4000, a3, OS_LOG_TYPE_ERROR, "Unable to set up extension runner %@ for activity %@", (uint8_t *)&v6, 0x16u);

}

@end
