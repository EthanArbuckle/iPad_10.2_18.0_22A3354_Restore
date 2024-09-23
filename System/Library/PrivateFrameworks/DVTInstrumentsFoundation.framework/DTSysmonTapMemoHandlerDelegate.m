@implementation DTSysmonTapMemoHandlerDelegate

- (DTSysmonTapMemoHandlerDelegate)init
{
  DTSysmonTapMemoHandlerDelegate *v2;
  uint64_t v3;
  DTSysmonTapRecordDecoder *recordDecoder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTSysmonTapMemoHandlerDelegate;
  v2 = -[DTSysmonTapMemoHandlerDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recordDecoder = v2->_recordDecoder;
    v2->_recordDecoder = (DTSysmonTapRecordDecoder *)v3;

  }
  return v2;
}

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_222B34D7C;
  v17 = sub_222B34D8C;
  v7 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend(v5, "samples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(objc_retainAutorelease((id)v14[5]), "bytes");
  v10 = objc_msgSend((id)v14[5], "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_222B34D94;
  v12[3] = &unk_24EB28BF8;
  v12[4] = &v13;
  objc_msgSend(v6, "handleBulkData:size:destructor:", v9, v10, v12);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setKind:", 1024);
  objc_msgSend(v6, "sendFrameMessage:", v11);

  _Block_object_dispose(&v13, 8);
}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "sessionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v11, "samples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSamples:", v9);

    objc_msgSend(v8, "setRecordDecoder:", self->_recordDecoder);
    objc_msgSend(v6, "sessionHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v8);

  }
}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v6;
  void *v7;
  DTSysmonRecordEnumerator *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "sessionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[DTSysmonRecordEnumerator initWithHeartbeatTime:]([DTSysmonRecordEnumerator alloc], "initWithHeartbeatTime:", objc_msgSend(v10, "timestamp"));
    -[DTSysmonRecordEnumerator setRecordDecoder:](v8, "setRecordDecoder:", self->_recordDecoder);
    objc_msgSend(v6, "sessionHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, DTSysmonRecordEnumerator *))v9)[2](v9, v8);

  }
}

- (id)peekAtMemo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "samples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v3, "samples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StartMachAbsTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("DTTapRecordingInfo_Timestamp"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDecoder, 0);
}

@end
