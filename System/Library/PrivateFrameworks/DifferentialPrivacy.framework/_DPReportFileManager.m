@implementation _DPReportFileManager

- (_DPReportFileManager)initWithDirectoryPath:(id)a3
{
  id v5;
  _DPReportFileManager *v6;
  _DPReportFileManager *v7;
  _DPDaemonConnection *connection;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DPReportFileManager;
  v6 = -[_DPReportFileManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);
    connection = v7->_connection;
    v7->_connection = 0;

  }
  return v7;
}

- (_DPReportFileManager)init
{
  void *v3;
  _DPReportFileManager *v4;

  +[_DPStrings transparencyLogDirectoryPath](_DPStrings, "transparencyLogDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_DPReportFileManager initWithDirectoryPath:](self, "initWithDirectoryPath:", v3);

  return v4;
}

- (void)dealloc
{
  _DPDaemonConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)_DPReportFileManager;
  -[_DPReportFileManager dealloc](&v4, sel_dealloc);
}

+ (id)submittedReports
{
  void *v3;
  void *v4;

  +[_DPStrings transparencyLogDirectoryPath](_DPStrings, "transparencyLogDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "submittedReportsInDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)submittedReportsInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D8256B78]();
  +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPReportFilesMaintainer retiredReportsPath:](_DPReportFilesMaintainer, "retiredReportsPath:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPReportFilesMaintainer reportsInDirectory:](_DPReportFilesMaintainer, "reportsInDirectory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_autoreleasePoolPop(v4);
  return v9;
}

- (id)reportsNotYetSubmitted
{
  _DPDaemonConnection *connection;
  _DPReportFileManager *v5;
  _DPDaemonConnection *v6;
  _DPDaemonConnection *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  connection = self->_connection;
  if (!connection)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!self->_connection)
    {
      +[_DPDaemonConnection daemonConnection](_DPDaemonConnection, "daemonConnection");
      v6 = (_DPDaemonConnection *)objc_claimAutoreleasedReturnValue();
      v7 = self->_connection;
      self->_connection = v6;

    }
    objc_sync_exit(v5);

    connection = self->_connection;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke;
  v10[3] = &unk_1E95D9338;
  v10[5] = &v11;
  v10[6] = a2;
  v10[4] = self;
  -[_DPDaemonConnection reportsNotYetSubmittedWithReply:](connection, "reportsNotYetSubmittedWithReply:", v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)retireReports:(id)a3
{
  id v5;
  _DPDaemonConnection *connection;
  _DPReportFileManager *v7;
  _DPDaemonConnection *v8;
  _DPDaemonConnection *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  connection = self->_connection;
  if (!connection)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!self->_connection)
    {
      +[_DPDaemonConnection daemonConnection](_DPDaemonConnection, "daemonConnection");
      v8 = (_DPDaemonConnection *)objc_claimAutoreleasedReturnValue();
      v9 = self->_connection;
      self->_connection = v8;

    }
    objc_sync_exit(v7);

    connection = self->_connection;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38___DPReportFileManager_retireReports___block_invoke;
  v11[3] = &unk_1E95D9360;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v10 = v5;
  -[_DPDaemonConnection retireReports:withReply:](connection, "retireReports:withReply:", v10, v11);

}

- (NSString)reportsDirectoryPath
{
  return self->_reportsDirectoryPath;
}

- (void)setReportsDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_DPDaemonConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_reportsDirectoryPath, 0);
}

@end
