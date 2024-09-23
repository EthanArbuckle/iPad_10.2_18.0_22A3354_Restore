@implementation NPDirectFlow

+ (void)initializeProtocol
{
  if (_MergedGlobals_30 != -1)
    dispatch_once(&_MergedGlobals_30, &__block_literal_global_1);
}

- (NPDirectFlow)initWithParameters:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  const void *bytes_ptr;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPDirectFlow;
  v5 = -[NPDirectFlow init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)nw_parameters_copy_metadata();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99D50]);
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      v9 = objc_msgSend(v7, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v6), 0);
      createPropertiesFromMetaData(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "flowIdentifier"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)*((_QWORD *)v5 + 9);
        *((_QWORD *)v5 + 9) = v12;

        nplog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *((_QWORD *)v5 + 9);
          *(_DWORD *)buf = 138412290;
          v21 = v15;
          _os_log_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_DEFAULT, "Created direct flow with identifier %@", buf, 0xCu);
        }
      }
      else
      {
        nplog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, "Failed to create properties dictionary from flow metadata", buf, 2u);
        }
      }

    }
    else
    {
      nplog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Direct flow has no metadata", buf, 2u);
      }
    }

    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *((_QWORD *)v5 + 3) = &xmmword_1ED0628D8;
    *((_QWORD *)v5 + 4) = &xmmword_1ED062900;
    v16 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v17 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v16;

  }
  return (NPDirectFlow *)v5;
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (void)handleDetachedFromProtocol
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NPDirectFlow connectionInfo](self, "connectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NPDirectFlow connectionInfo](self, "connectionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPDirectFlow identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConnectionInfo:forIdentifier:", v4, v5);

  }
}

- (void)createConnectionInfo
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void (*v7)(uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSPConnectionInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  id v32;

  v3 = (uint64_t)-[NPDirectFlow protocol](self, "protocol")[48];
  v4 = (uint64_t)-[NPDirectFlow protocol](self, "protocol")[32];
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)(v3 + 24) + 120))(v3);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(*(_QWORD *)(v3 + 24) + 112))(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(uint64_t))(*(_QWORD *)(v4 + 24) + 208);
    if (v7)
    {
      v7(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)(v3 + 24) + 136))(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPDirectFlow connectionInfo](self, "connectionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[NSPManager sharedManager](NSPManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPDirectFlow identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getConnectionInfoForIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPDirectFlow setConnectionInfo:](self, "setConnectionInfo:", v13);

      -[NPDirectFlow connectionInfo](self, "connectionInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = objc_alloc_init(NSPConnectionInfo);
        -[NPDirectFlow setConnectionInfo:](self, "setConnectionInfo:", v15);

      }
    }
    -[NPDirectFlow connectionInfo](self, "connectionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPUtilities fillOutConnectionInfo:withPath:interface:remoteEndpoint:parameters:outputHandler:](NPUtilities, "fillOutConnectionInfo:withPath:interface:remoteEndpoint:parameters:outputHandler:", v16, v32, v8, v9, v6, v4);

    -[NPDirectFlow connectionInfo](self, "connectionInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPathType:", 2);

    -[NPDirectFlow connectionStartDate](self, "connectionStartDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NPDirectFlow startDate](self, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPDirectFlow connectionStartDate](self, "connectionStartDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v20);
      v22 = v21;

      if (v22 < 0.0)
      {
        -[NPDirectFlow connectionInfo](self, "connectionInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setConnectionDelay:", v22 * -1000.0);

      }
    }
    -[NPDirectFlow firstTxByteTimestamp](self, "firstTxByteTimestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPDirectFlow connectionInfo](self, "connectionInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFirstTxByteTimeStamp:", v24);

    -[NPDirectFlow firstTxByteTimestamp](self, "firstTxByteTimestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[NPDirectFlow startDate](self, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPDirectFlow firstTxByteTimestamp](self, "firstTxByteTimestamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceDate:", v28);
      v30 = v29;

      if (v30 < 0.0)
      {
        -[NPDirectFlow connectionInfo](self, "connectionInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setFirstTxByteDelay:", v30 * -1000.0);

      }
    }

  }
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSPConnectionInfo)connectionInfo
{
  return (NSPConnectionInfo *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (NSDate)connectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnectionStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDate)firstTxByteTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFirstTxByteTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTxByteTimestamp, 0);
  objc_storeStrong((id *)&self->_connectionStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
