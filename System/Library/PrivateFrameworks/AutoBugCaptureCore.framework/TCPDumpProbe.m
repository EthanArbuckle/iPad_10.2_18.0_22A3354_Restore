@implementation TCPDumpProbe

- (TCPDumpProbe)initWithQueue:(id)a3
{
  TCPDumpProbe *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCPDumpProbe;
  v3 = -[TestProbe initWithQueue:](&v6, sel_initWithQueue_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagTaskSymptomsPcap[0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetDiagnosticProbe setTaskName:](v3, "setTaskName:", v4);

    -[TCPDumpProbe setDuration:](v3, "setDuration:", 30.0);
  }
  return v3;
}

- (void)startTCPDumpWithDuration:(double)a3 destinationPath:(id)a4 tcpDumpStarted:(id)a5 tcpDumpCompleted:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  uint8_t buf[4];
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  symptomsLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a3;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "TCPDumpProbe startTCPDumpWithDuration - duration (%f)", buf, 0xCu);
  }

  -[TCPDumpProbe setDuration:](self, "setDuration:", a3);
  -[TCPDumpProbe setDestinationPath:](self, "setDestinationPath:", v12);

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke;
  aBlock[3] = &unk_1EA3B50D8;
  aBlock[4] = self;
  v23 = v11;
  v15 = v10;
  v24 = v15;
  v16 = v11;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_180;
  v19[3] = &unk_1EA3B5100;
  v19[4] = self;
  v20 = v15;
  v17 = _Block_copy(aBlock);
  v21 = v17;
  v18 = v15;
  if (!-[NetDiagnosticProbe netDiagnosticsTaskInProgress:](self, "netDiagnosticsTaskInProgress:", v19))
    v17[2](v17);

}

void __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[8];
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_2;
  v6[3] = &unk_1EA3B50B0;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  if ((objc_msgSend(v7, "startNetDiagnosticsTask:", v6) & 1) == 0)
  {
    symptomsLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Could not even start the TCP Dump", v5, 2u);
    }

    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 3);
  }

}

uint64_t __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  const void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  symptomsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    +[TestProbe testProbeStatusString:](TestProbe, "testProbeStatusString:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "startTCPDumpWithDuration Status Update %@", (uint8_t *)&v8, 0xCu);

  }
  if ((a2 - 3) > 2)
  {
    v6 = *(const void **)(a1 + 40);
    if (v6)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = _Block_copy(v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeProbeOutputFiles");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __89__TCPDumpProbe_startTCPDumpWithDuration_destinationPath_tcpDumpStarted_tcpDumpCompleted___block_invoke_180(uint64_t result, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  if ((a2 + 1) <= 6)
  {
    v2 = result;
    if (((1 << (a2 + 1)) & 0x1B) != 0)
    {
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 48) + 16))();
    }
    else if (a2 == 1)
    {
      symptomsLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "A TCP Dump is already in progress. We cannot stop it.", v5, 2u);
      }

      v4 = *(_QWORD *)(v2 + 40);
      if (v4)
        (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 3);
      return objc_msgSend(*(id *)(v2 + 32), "disconnectFromNetDiagnostics");
    }
    else if (a2 == 5)
    {
      return objc_msgSend(*(id *)(result + 32), "disconnectFromNetDiagnostics");
    }
  }
  return result;
}

- (BOOL)startNetDiagnosticsTask:(id)a3
{
  id v4;
  id v5;
  double duration;
  NSObject *v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD handler[5];
  objc_super v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NetDiagnosticProbe setUpDefaultTaskDictionary](self, "setUpDefaultTaskDictionary");
  v14.receiver = self;
  v14.super_class = (Class)TCPDumpProbe;
  -[NetDiagnosticProbe startNetDiagnosticsTask:](&v14, sel_startNetDiagnosticsTask_, v4);

  duration = self->_duration;
  if (duration < 5.0 || duration > 900.0)
  {
    symptomsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = self->_duration;
      *(_DWORD *)buf = 134218240;
      v16 = v8;
      v17 = 2048;
      v18 = 0x403E000000000000;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Unsupported TCP dump duration (%f) request. Resetting to %f", buf, 0x16u);
    }

    self->_duration = 30.0;
  }
  -[TestProbe queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);

  v11 = dispatch_time(0, (uint64_t)(self->_duration * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __40__TCPDumpProbe_startNetDiagnosticsTask___block_invoke;
  handler[3] = &unk_1EA3B4960;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  -[TCPDumpProbe setTcpDumpTimer:](self, "setTcpDumpTimer:", v10);
  dispatch_resume(v10);

  return 1;
}

uint64_t __40__TCPDumpProbe_startNetDiagnosticsTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  symptomsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEFAULT, "TCP Dump Duration completed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "stopNetDiagnosticsTask:", 0);
}

- (void)stopTest
{
  -[TCPDumpProbe stopNetDiagnosticsTask:](self, "stopNetDiagnosticsTask:", 0);
}

- (BOOL)stopNetDiagnosticsTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  objc_super v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  symptomsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "TCPDumpProbe stopNetDiagnosticsTask", buf, 2u);
  }

  -[TCPDumpProbe tcpDumpTimer](self, "tcpDumpTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TCPDumpProbe tcpDumpTimer](self, "tcpDumpTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[TCPDumpProbe setTcpDumpTimer:](self, "setTcpDumpTimer:", 0);
  }
  if (-[TestProbe isRunning](self, "isRunning"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__TCPDumpProbe_stopNetDiagnosticsTask___block_invoke;
    v10[3] = &unk_1EA3B5088;
    v10[4] = self;
    v11 = v4;
    v9.receiver = self;
    v9.super_class = (Class)TCPDumpProbe;
    -[NetDiagnosticProbe stopNetDiagnosticsTask:](&v9, sel_stopNetDiagnosticsTask_, v10);

  }
  return 1;
}

void __39__TCPDumpProbe_stopNetDiagnosticsTask___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const void *v7;

  objc_msgSend(*(id *)(a1 + 32), "disconnectFromNetDiagnostics");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  else
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[12];
    if (v6)
    {
      if ((_DWORD)a2 == 4)
      {
        objc_msgSend(v5, "removeProbeOutputFiles");
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      }
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
    }
  }
  v7 = *(const void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v7)
  {
    _Block_release(v7);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  }
}

- (id)probeOutputFilePaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetDiagnosticProbe ndFilePath](self, "ndFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "rangeOfString:options:", CFSTR("-"), 4);
    if (v9 == 1)
    {
      objc_msgSend(v7, "substringToIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      symptomsLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Could not parse pcapng file name", buf, 2u);
      }

      v10 = 0;
    }
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v14, 0, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "nextObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v27 = v14;
          v19 = v3;
          v20 = 0;
          do
          {
            v21 = v20;
            v22 = (void *)MEMORY[0x1DF0B6314]();
            objc_msgSend(v18, "lastPathComponent");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v21) = objc_msgSend(v23, "isEqualToString:", CFSTR("pcapng"));

            if ((_DWORD)v21 && (!v10 || objc_msgSend(v20, "containsString:", v10)))
            {
              objc_msgSend(v18, "path");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v24);

            }
            objc_autoreleasePoolPop(v22);
            objc_msgSend(v16, "nextObject");
            v25 = objc_claimAutoreleasedReturnValue();

            v18 = (void *)v25;
          }
          while (v25);

          v3 = v19;
          v14 = v27;
        }
      }

    }
  }

  return v3;
}

- (OS_dispatch_source)tcpDumpTimer
{
  return self->_tcpDumpTimer;
}

- (void)setTcpDumpTimer:(id)a3
{
  objc_storeStrong((id *)&self->_tcpDumpTimer, a3);
}

- (id)tcpDumpCompletedBlock
{
  return self->_tcpDumpCompletedBlock;
}

- (void)setTcpDumpCompletedBlock:(id)a3
{
  self->_tcpDumpCompletedBlock = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_tcpDumpTimer, 0);
}

@end
