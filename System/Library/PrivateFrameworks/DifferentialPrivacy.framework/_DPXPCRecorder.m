@implementation _DPXPCRecorder

- (_DPXPCRecorder)init
{

  return 0;
}

- (_DPXPCRecorder)initWithKey:(id)a3
{
  _DPXPCRecorder *v3;
  uint64_t v4;
  _DPDaemonConnection *connection;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DPXPCRecorder;
  v3 = -[_DPDataRecorder initWithKey:](&v7, sel_initWithKey_, a3);
  if (v3)
  {
    +[_DPDaemonConnection daemonConnection](_DPDaemonConnection, "daemonConnection");
    v4 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (_DPDaemonConnection *)v4;

  }
  return v3;
}

- (void)handleReturn:(BOOL)a3 forSelector:(id)a4 key:(id)a5 values:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  +[_DPLog framework](_DPLog, "framework");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a3)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138413058;
      v19 = (id)objc_opt_class();
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v17 = v19;
      _os_log_debug_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_DEBUG, "%@ : %@ : forKey: %@ : values: %@", (uint8_t *)&v18, 0x2Au);
LABEL_7:

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v18 = 138413058;
    v19 = (id)objc_opt_class();
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v14;
    v17 = v19;
    _os_log_error_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_ERROR, "%@ : %@ : forKey: %@ : error %@", (uint8_t *)&v18, 0x2Au);
    goto LABEL_7;
  }

}

- (void)recordNumbers:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32___DPXPCRecorder_recordNumbers___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordNumbers:forKey:withReply:](connection, "recordNumbers:forKey:withReply:", v8, v9, v10);

}

- (void)recordNumbers:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41___DPXPCRecorder_recordNumbers_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordNumbers:metadata:forKey:withReply:](connection, "recordNumbers:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordNumbersVectors:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39___DPXPCRecorder_recordNumbersVectors___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordNumbersVectors:forKey:withReply:](connection, "recordNumbersVectors:forKey:withReply:", v8, v9, v10);

}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48___DPXPCRecorder_recordNumbersVectors_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordNumbersVectors:metadata:forKey:withReply:](connection, "recordNumbersVectors:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordBitValues:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34___DPXPCRecorder_recordBitValues___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordBitValues:forKey:withReply:](connection, "recordBitValues:forKey:withReply:", v8, v9, v10);

}

- (void)recordBitValues:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43___DPXPCRecorder_recordBitValues_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordBitValues:metadata:forKey:withReply:](connection, "recordBitValues:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordBitVectors:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35___DPXPCRecorder_recordBitVectors___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordBitVectors:forKey:withReply:](connection, "recordBitVectors:forKey:withReply:", v8, v9, v10);

}

- (void)recordBitVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44___DPXPCRecorder_recordBitVectors_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordBitVectors:metadata:forKey:withReply:](connection, "recordBitVectors:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordFloatVectors:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37___DPXPCRecorder_recordFloatVectors___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordFloatVectors:forKey:withReply:](connection, "recordFloatVectors:forKey:withReply:", v8, v9, v10);

}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46___DPXPCRecorder_recordFloatVectors_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordFloatVectors:metadata:forKey:withReply:](connection, "recordFloatVectors:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordStrings:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32___DPXPCRecorder_recordStrings___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordStrings:forKey:withReply:](connection, "recordStrings:forKey:withReply:", v8, v9, v10);

}

- (void)recordStrings:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _DPDaemonConnection *connection;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DPXPCRecorder;
  v8 = a4;
  -[_DPDataRecorder keyName](&v17, sel_keyName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41___DPXPCRecorder_recordStrings_metadata___block_invoke;
  v13[3] = &unk_1E95D9CC8;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v16 = a2;
  v11 = v7;
  v12 = v9;
  -[_DPDaemonConnection recordStrings:metadata:forKey:withReply:](connection, "recordStrings:metadata:forKey:withReply:", v11, v8, v12, v13);

}

- (void)recordWords:(id)a3
{
  id v5;
  void *v6;
  _DPDaemonConnection *connection;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPXPCRecorder;
  -[_DPDataRecorder keyName](&v14, sel_keyName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30___DPXPCRecorder_recordWords___block_invoke;
  v10[3] = &unk_1E95D9CC8;
  v10[4] = self;
  v11 = v6;
  v12 = v5;
  v13 = a2;
  v8 = v5;
  v9 = v6;
  -[_DPDaemonConnection recordWords:forKey:withReply:](connection, "recordWords:forKey:withReply:", v8, v9, v10);

}

- (_DPDaemonConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
