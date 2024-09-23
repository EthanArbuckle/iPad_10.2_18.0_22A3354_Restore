@implementation ABCFileCleaner

- (ABCFileCleaner)initWithQueue:(id)a3
{
  id v4;
  ABCFileCleaner *v5;
  OS_dispatch_queue *v6;
  NSObject *queue;
  dispatch_queue_t v8;
  OS_dispatch_queue *v9;
  NetDiagnosticsShim *v10;
  NetDiagnosticsShim *netDiags;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ABCFileCleaner;
  v5 = -[ABCFileCleaner init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      queue = v5->_queue;
      v5->_queue = v6;
    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      queue = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("com.apple.symptoms.autobugcapture.cleanup", queue);
      v9 = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v8;

    }
    v10 = -[NetDiagnosticsShim initWithTaskName:queue:]([NetDiagnosticsShim alloc], "initWithTaskName:queue:", CFSTR("deletefilesforsymptoms"), v5->_queue);
    netDiags = v5->_netDiags;
    v5->_netDiags = v10;

    -[NetDiagnosticsShim setDelegate:](v5->_netDiags, "setDelegate:", v5);
  }

  return v5;
}

- (void)cleanupFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[ABCFileCleaner setFilesToDelete:](self, "setFilesToDelete:", v4);
  -[ABCFileCleaner netDiags](self, "netDiags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("deletefilesforsymptoms"), CFSTR("taskName"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("taskFileDicts"));
    -[ABCFileCleaner queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__ABCFileCleaner_cleanupFiles___block_invoke;
    v9[3] = &unk_1EA3B5010;
    v10 = v5;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

uint64_t __31__ABCFileCleaner_cleanupFiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startNetDiagnosticTaskWithOptions:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_2);
}

void __31__ABCFileCleaner_cleanupFiles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "SymptomsFileCleaner NetDiagnosticShim start called:%@ error:%@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)netDiagnosticTaskStatusChangedFor:(id)a3 toStatus:(int)a4
{
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  v6 = objc_msgSend(a3, "isEqualToString:", CFSTR("deletefilesforsymptoms"));
  if (a4 == 3 && v6)
  {
    symptomsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Completed kNetDiagTaskDeleteFilesForSymptoms", v11, 2u);
    }

    -[ABCFileCleaner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ABCFileCleaner delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileCleanupComplete");

    }
    -[NetDiagnosticsShim setDelegate:](self->_netDiags, "setDelegate:", 0);
  }
}

- (SymptomsFileCleanerDelegate)delegate
{
  return (SymptomsFileCleanerDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NetDiagnosticsShim)netDiags
{
  return (NetDiagnosticsShim *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetDiags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)filesToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFilesToDelete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filesToDelete, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_netDiags, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
