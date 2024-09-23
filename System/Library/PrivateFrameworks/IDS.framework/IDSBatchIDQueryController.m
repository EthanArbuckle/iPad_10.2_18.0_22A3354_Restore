@implementation IDSBatchIDQueryController

- (IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  IDSBatchIDQueryController *v12;
  IDSBatchIDQueryController *v13;
  NSObject *v14;
  _QWORD v16[4];
  IDSBatchIDQueryController *v17;
  id v18;
  id v19;
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDQuery](IDSLogging, "IDQuery");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v11);

    v12 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)IDSBatchIDQueryController;
    v13 = -[IDSBatchIDQueryController init](&v21, sel_init);
    if (v13)
    {
      if (qword_1EE1E1F58 != -1)
        dispatch_once(&qword_1EE1E1F58, &unk_1E2C5F8B0);
      v14 = qword_1EE1E1F60;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = sub_190725A14;
      v16[3] = &unk_1E2C60C50;
      v17 = v13;
      v18 = v8;
      v19 = v9;
      v20 = v10;
      dispatch_sync(v14, v16);

    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190725AD4;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1EE1E1F60, block);
  v3.receiver = self;
  v3.super_class = (Class)IDSBatchIDQueryController;
  -[IDSBatchIDQueryController dealloc](&v3, sel_dealloc);
}

- (void)setDestinations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = qword_1EE1E1F60;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190725B64;
  block[3] = &unk_1E2C607A8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)invalidate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_190725BCC;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1EE1E1F60, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
