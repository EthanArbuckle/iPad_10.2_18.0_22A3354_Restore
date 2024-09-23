@implementation BLUIHostServiceNonUI

- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  BLDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use out-of-process authenticate", buf, 2u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08038]), "initWithRequest:", v6);
  objc_msgSend(v8, "performAuthentication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CA3014;
  v11[3] = &unk_24CE8B828;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

- (void)handleDialogRequest:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  BLDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use out-of-process dialog", buf, 2u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE083D8]), "initWithRequest:", v5);
  objc_msgSend(v8, "present");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CA318C;
  v12[3] = &unk_24CE8B850;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "addFinishBlock:", v12);

}

- (void)handleEngagementRequest:(id)a3 withReply:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a4;
  BLDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v5, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: Engagement request not supported for non-UI", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x24BE08340]);
  BLError(0, CFSTR("Engagement request not supported for non-UI"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithError:", v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_212CA33D0;
  v9[3] = &unk_24CE8B878;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "addFinishBlock:", v9);

}

@end
