@implementation BLUIHostServiceProxy

- (BLUIHostServiceProxy)initWithUIManager:(id)a3 forRequest:(id)a4 inDownloadQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLUIHostServiceProxy *v11;
  BLUIHostServiceProxy *v12;
  BLUIHostServiceNonUI *v13;
  BLUIHostServiceNonUI *fallback;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BLUIHostServiceProxy;
  v11 = -[BLUIHostServiceProxy init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_request, v9);
    objc_storeWeak((id *)&v12->_downloadQueue, v10);
    objc_storeWeak((id *)&v12->_uiManagerDelegate, v8);
    v13 = (BLUIHostServiceNonUI *)objc_alloc_init(MEMORY[0x24BE0FBA0]);
    fallback = v12->_fallback;
    v12->_fallback = v13;

  }
  return v12;
}

- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_213240D6C;
  v16[3] = &unk_24CF70AA0;
  v16[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v17 = v10;
  v13 = (void (**)(_QWORD))MEMORY[0x2199AEBD8](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = sub_2132410D8;
      v14[3] = &unk_24CF70AC8;
      v15 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }

}

- (void)handleDialogRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_2132411F8;
  v16[3] = &unk_24CF70AA0;
  v16[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v17 = v10;
  v13 = (void (**)(_QWORD))MEMORY[0x2199AEBD8](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = sub_213241614;
      v14[3] = &unk_24CF70AC8;
      v15 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }

}

- (void)handleEngagementRequest:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_213241734;
  v16[3] = &unk_24CF70AA0;
  v16[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = v6;
  v17 = v10;
  v13 = (void (**)(_QWORD))MEMORY[0x2199AEBD8](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x24BDD17F0], v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = sub_213241C34;
      v14[3] = &unk_24CF70AC8;
      v15 = v13;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }

}

- (id)_topMostViewController
{
  NSObject *v2;
  id v3;
  uint8_t v5[8];
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_213241D9C;
  v11 = sub_213241DAC;
  v12 = 0;
  sub_213242298();
  if (objc_opt_class() && (sub_2132423A4(), objc_opt_class()) && (sub_2132425BC(), objc_opt_class()))
  {
    v2 = _os_activity_create(&dword_21323F000, "Find Top Most View Controller", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_213241DB4;
    block[3] = &unk_24CF70B68;
    block[4] = &v7;
    os_activity_apply(v2, block);
  }
  else
  {
    BLDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21323F000, v2, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link UIKit!", v5, 2u);
    }
  }

  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (BLDownloadQueue)downloadQueue
{
  return (BLDownloadQueue *)objc_loadWeakRetained((id *)&self->_downloadQueue);
}

- (BLUIHostServiceNonUI)fallback
{
  return (BLUIHostServiceNonUI *)objc_getProperty(self, a2, 16, 1);
}

- (BLRequest)request
{
  return (BLRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (BLDownloadQueueUIManagerProtocol)uiManagerDelegate
{
  return (BLDownloadQueueUIManagerProtocol *)objc_loadWeakRetained((id *)&self->_uiManagerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiManagerDelegate);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_destroyWeak((id *)&self->_downloadQueue);
}

@end
