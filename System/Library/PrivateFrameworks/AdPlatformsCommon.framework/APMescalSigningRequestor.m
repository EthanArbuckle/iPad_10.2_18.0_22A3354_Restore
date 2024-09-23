@implementation APMescalSigningRequestor

- (APMescalSigningRequestor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APMescalSigningRequestor;
  return -[APXPCActionRequester init](&v3, sel_init);
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend_remoteObjectProxy(self, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_21A21E730;
  v20[3] = &unk_24DC80970;
  v21 = v6;
  v15 = v6;
  objc_msgSend_signatureForData_completion_(v14, v16, (uint64_t)v7, (uint64_t)v20, v17, v18, v19);

}

- (id)signatureForData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_21A21E940;
  v20 = sub_21A21E950;
  v21 = 0;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v5, (uint64_t)&unk_24DC80660, v6, v7, COERCE_DOUBLE(0x3032000000), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_21A21EA04;
  v15[3] = &unk_24DC80998;
  v15[4] = &v16;
  objc_msgSend_signatureForData_completion_(v9, v10, (uint64_t)v4, (uint64_t)v15, v11, COERCE_DOUBLE(3221225472), v12);

  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  v9 = a3;
  objc_msgSend_remoteObjectProxy(self, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_21A21EB9C;
  v21[3] = &unk_24DC80970;
  v22 = v8;
  v17 = v8;
  objc_msgSend_signatureForData_waitTime_completion_(v16, v18, (uint64_t)v9, (uint64_t)v21, v19, a4, v20);

}

- (id)remoteObjectInterface
{
  return &unk_2550D5C20;
}

- (void)connectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A211000, v2, OS_LOG_TYPE_DEFAULT, "Connection to MescalSigning in Daemon was interrupted.", v3, 2u);
  }

}

- (void)connectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21A211000, v2, OS_LOG_TYPE_INFO, "Connection to MescalSigning in Daemon was invalidated.", v3, 2u);
  }

}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.mescalinterface");
}

@end
