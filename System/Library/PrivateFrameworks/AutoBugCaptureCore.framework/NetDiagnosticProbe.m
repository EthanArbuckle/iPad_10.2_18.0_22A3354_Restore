@implementation NetDiagnosticProbe

- (void)setNetDiags:(id)a3
{
  NetDiagnosticsShim *v5;
  NetDiagnosticsShim *netDiags;
  NetDiagnosticsShim *v7;

  v5 = (NetDiagnosticsShim *)a3;
  netDiags = self->_netDiags;
  if (netDiags != v5)
  {
    v7 = v5;
    if (netDiags)
    {
      -[NetDiagnosticsShim setDelegate:](netDiags, "setDelegate:", 0);
      -[NetDiagnosticsShim invalidateConnections](self->_netDiags, "invalidateConnections");
      v5 = v7;
    }
    if (v5)
      -[NetDiagnosticsShim setDelegate:](v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_netDiags, a3);
    v5 = v7;
  }

}

- (NetDiagnosticsShim)netDiags
{
  NetDiagnosticsShim *netDiags;
  NetDiagnosticsShim *v4;
  NSString *taskName;
  void *v6;
  NetDiagnosticsShim *v7;

  netDiags = self->_netDiags;
  if (!netDiags)
  {
    v4 = [NetDiagnosticsShim alloc];
    taskName = self->_taskName;
    -[TestProbe queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NetDiagnosticsShim initWithTaskName:queue:](v4, "initWithTaskName:queue:", taskName, v6);
    -[NetDiagnosticProbe setNetDiags:](self, "setNetDiags:", v7);

    netDiags = self->_netDiags;
  }
  return netDiags;
}

- (void)dealloc
{
  objc_super v3;

  -[NetDiagnosticProbe setNetDiags:](self, "setNetDiags:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NetDiagnosticProbe;
  -[NetDiagnosticProbe dealloc](&v3, sel_dealloc);
}

- (void)disconnectFromNetDiagnostics
{
  -[NetDiagnosticProbe setNetDiags:](self, "setNetDiags:", 0);
}

- (id)setUpDefaultTaskDictionary
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetDiagnosticProbe taskName](self, "taskName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("taskName"));

  v12 = 0;
  v13 = 0;
  v11 = 0;
  +[TestProbe autoBugCapturePath:autoBugCaptureUID:autoBugCaptureGID:](TestProbe, "autoBugCapturePath:autoBugCaptureUID:autoBugCaptureGID:", &v13, &v12, &v11);
  v5 = v13;
  v6 = v12;
  v7 = v11;
  v8 = v7;
  if (v5 && v6 && v7)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("filename"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("taskFileUserID"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("taskFileGroupID"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA3CFA80, CFSTR("taskFileMode"));
  -[NetDiagnosticProbe setNetDiagsTaskDict:](self, "setNetDiagsTaskDict:", v3);

  return v3;
}

- (BOOL)startNetDiagnosticsTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[TestProbe setStatus:](self, "setStatus:", 1);
  -[NetDiagnosticProbe netDiags](self, "netDiags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetDiagnosticProbe netDiagsTaskDict](self, "netDiagsTaskDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke;
  v9[3] = &unk_1EA3B5060;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "startNetDiagnosticTaskWithOptions:reply:", v6, v9);

  return (char)v4;
}

void __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (!v6)
      goto LABEL_13;
    symptomsLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);

    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNdFilePath:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagStatus[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "longLongValue");

  if (v12)
  {
    if (v12 != -1)
    {
      symptomsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "taskName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v24 = v14;
        v25 = 2048;
        v26 = v15;
        v27 = 2048;
        v28 = v12;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "%@ (%p) Unknown kNetDiagStatus %lld\n", buf, 0x20u);

      }
      v16 = *(void **)(a1 + 32);
      v17 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }
LABEL_11:
    v16 = *(void **)(a1 + 32);
    v17 = 3;
LABEL_12:
    objc_msgSend(v16, "setStatus:", v17);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRunning:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 5)
  {
    v21 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke_2;
    v22[3] = &unk_1EA3B5038;
    v22[4] = v21;
    objc_msgSend(v21, "stopNetDiagnosticsTask:", v22);
  }
LABEL_13:
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, objc_msgSend(*(id *)(a1 + 32), "status"));

}

uint64_t __46__NetDiagnosticProbe_startNetDiagnosticsTask___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeProbeOutputFiles");
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 4);
  return objc_msgSend(*(id *)(a1 + 32), "disconnectFromNetDiagnostics");
}

- (void)cancelTest:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[TestProbe isRunning](self, "isRunning"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __33__NetDiagnosticProbe_cancelTest___block_invoke;
    v5[3] = &unk_1EA3B5088;
    v5[4] = self;
    v6 = v4;
    -[NetDiagnosticProbe stopNetDiagnosticsTask:](self, "stopNetDiagnosticsTask:", v5);

  }
  else
  {
    -[TestProbe setStatus:](self, "setStatus:", 5);
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, -[TestProbe status](self, "status"));
  }

}

uint64_t __33__NetDiagnosticProbe_cancelTest___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 4);
  objc_msgSend(*(id *)(a1 + 32), "removeProbeOutputFiles");
  result = objc_msgSend(*(id *)(a1 + 32), "disconnectFromNetDiagnostics");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(*(id *)(a1 + 32), "status"));
  return result;
}

- (BOOL)stopNetDiagnosticsTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[TestProbe setRunning:](self, "setRunning:", 0);
  -[NetDiagnosticProbe netDiags](self, "netDiags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__NetDiagnosticProbe_stopNetDiagnosticsTask___block_invoke;
  v8[3] = &unk_1EA3B5060;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "stopNetDiagnosticTaskWithReply:", v8);

  return (char)v4;
}

void __45__NetDiagnosticProbe_stopNetDiagnosticsTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagStatus[0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longLongValue");

    if (!v10)
    {
      v12 = *(void **)(a1 + 32);
      v13 = 2;
      goto LABEL_13;
    }
    if (v10 != -1)
    {
      symptomsLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = v10;
        _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Unknown kNetDiagStatus %lld\n", (uint8_t *)&v17, 0xCu);
      }

      v12 = *(void **)(a1 + 32);
      v13 = 0xFFFFFFFFLL;
      goto LABEL_13;
    }
  }
  else
  {
    if (!v6)
      goto LABEL_14;
    symptomsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = (uint64_t)v15;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v17, 0xCu);

    }
  }
  v12 = *(void **)(a1 + 32);
  v13 = 3;
LABEL_13:
  objc_msgSend(v12, "setStatus:", v13);
LABEL_14:
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, objc_msgSend(*(id *)(a1 + 32), "status"));

}

- (BOOL)netDiagnosticsTaskInProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NetDiagnosticProbe netDiags](self, "netDiags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NetDiagnosticProbe_netDiagnosticsTaskInProgress___block_invoke;
  v8[3] = &unk_1EA3B5060;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "netDiagnosticTaskStatusWithReply:", v8);

  return (char)v4;
}

void __51__NetDiagnosticProbe_netDiagnosticsTaskInProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 5)
  {
    if (!v5)
    {
      if (!v6)
        goto LABEL_20;
      symptomsLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        objc_msgSend(v6, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v12;
        v25 = 2112;
        v26 = (uint64_t)v13;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "%@ kNetDiagCmdTasksStatus %@", (uint8_t *)&v23, 0x16u);

      }
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagStatus[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

    if (v9)
    {
      symptomsLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v23 = 138412546;
        v24 = v11;
        v25 = 2048;
        v26 = v9;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "%@ kNetDiagStatus is %lld\n", (uint8_t *)&v23, 0x16u);
      }
LABEL_9:

      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", kNetDiagKeyValues[0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "longLongValue");

      switch(v17)
      {
        case 0:
          v18 = *(void **)(a1 + 32);
          v19 = 0;
          break;
        case 1:
        case 2:
          v18 = *(void **)(a1 + 32);
          v19 = 1;
          break;
        case 3:
          v18 = *(void **)(a1 + 32);
          v19 = 2;
          break;
        default:
          symptomsLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
            v23 = 138412546;
            v24 = v21;
            v25 = 2048;
            v26 = v17;
            _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_INFO, "%@  UNEXPECTED status %lld", (uint8_t *)&v23, 0x16u);
          }

          v18 = *(void **)(a1 + 32);
          v19 = 0xFFFFFFFFLL;
          break;
      }
      objc_msgSend(v18, "setStatus:", v19);
    }

  }
LABEL_20:
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, objc_msgSend(*(id *)(a1 + 32), "status"));

}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
  objc_storeStrong((id *)&self->_taskName, a3);
}

- (NSString)ndFilePath
{
  return self->_ndFilePath;
}

- (void)setNdFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_ndFilePath, a3);
}

- (NSMutableDictionary)netDiagsTaskDict
{
  return self->_netDiagsTaskDict;
}

- (void)setNetDiagsTaskDict:(id)a3
{
  objc_storeStrong((id *)&self->_netDiagsTaskDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netDiagsTaskDict, 0);
  objc_storeStrong((id *)&self->_ndFilePath, 0);
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_netDiags, 0);
}

@end
