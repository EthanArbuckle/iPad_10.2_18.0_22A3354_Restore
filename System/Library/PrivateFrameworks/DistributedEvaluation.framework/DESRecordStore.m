@implementation DESRecordStore

- (DESRecordStore)initWithBundleIdentifier:(id)a3
{
  id v4;
  DESRecordStore *v5;
  uint64_t v6;
  NSString *bundleId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DESRecordStore;
  v5 = -[DESRecordStore init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isPermitted
{
  id v2;

  v2 = DESLogAndReturnSunsetError();
  return 0;
}

- (BOOL)shouldMakeRecord
{
  id v2;

  v2 = DESLogAndReturnSunsetError();
  return 0;
}

- (BOOL)shouldMakeRecordWithFrequency:(unint64_t)a3
{
  id v3;

  v3 = DESLogAndReturnSunsetError();
  return 0;
}

+ (void)_getServiceProxyWithErrorHandler:(id)a3 block:(id)a4
{
  id v5;
  objc_class *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void (*v14)(_QWORD *, void *, _QWORD *);
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3B38];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithServiceName:", CFSTR("com.apple.siri-distributed-evaluation"));
  DESServiceGetXPCInterface(0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "resume");
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke;
  v18[3] = &unk_1E706ED10;
  v11 = v8;
  v19 = v11;
  v20 = v5;
  v12 = v5;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke_2;
  v16[3] = &unk_1E706E9B0;
  v17 = v11;
  v14 = (void (*)(_QWORD *, void *, _QWORD *))v7[2];
  v15 = v11;
  v14(v7, v13, v16);

}

void __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __57__DESRecordStore__getServiceProxyWithErrorHandler_block___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)saveRecordWithData:(id)a3 recordInfo:(id)a4 completion:(id)a5
{
  id v6;
  id v7;

  if (a5)
  {
    v6 = a5;
    DESLogAndReturnSunsetError();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v7);

  }
}

- (void)fetchSavedRecordInfoWithCompletion:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    DESLogAndReturnSunsetError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a3 + 2))(v4, 0, v5);

  }
}

- (void)deleteAllSavedRecordsWithCompletion:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    DESLogAndReturnSunsetError();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v4, v5);

  }
}

- (void)deleteSavedRecordWithIdentfier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    DESLogAndReturnSunsetError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v5, v6);

  }
}

- (void)saveCoreDuetEvent:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    DESLogAndReturnSunsetError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

  }
}

- (void)fetchNativeRecordDataForRecordUUID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    DESLogAndReturnSunsetError();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
