@implementation DTActivityTraceTapMemoHandlerDelegate

- (void)sendDataMemo:(id)a3 toBulkReceiver:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "getBufferWithLength:", &v13);
  if (v13)
  {
    v9 = v8;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_222B647C4;
    v11[4] = sub_222B647D4;
    v12 = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_222B647DC;
    v10[3] = &unk_24EB28BF8;
    v10[4] = v11;
    objc_msgSend(v6, "handleBulkData:size:destructor:", v9, v13, v10);
    _Block_object_dispose(v11, 8);

  }
  if (objc_msgSend(v7, "finalMemo"))
    objc_msgSend(v6, "sendHeartbeatTime:", objc_msgSend(v7, "lastMachContinuousTimeSeen"));

}

- (void)sendDataMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a3;
  objc_msgSend(a4, "memoHandler");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (void)sendHeartbeatMemo:(id)a3 toClientUsingConfig:(id)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a3;
  objc_msgSend(a4, "memoHandler");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (id)peekAtMemo:(id)a3
{
  return (id)objc_opt_new();
}

@end
