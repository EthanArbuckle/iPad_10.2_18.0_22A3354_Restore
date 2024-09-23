@implementation IDSBAASigner

- (IDSBAASigner)initWithQueue:(id)a3
{
  id v5;
  IDSBAASigner *v6;
  IDSBAASigner *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *baaQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSBAASigner;
  v6 = -[IDSBAASigner init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.IDS.IDSBAASigner.BAA", v8);
    baaQueue = v7->_baaQueue;
    v7->_baaQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)headersBySigningData:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  IDSBAASigner *v21;
  id v22;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[IDSBAASigner queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_19076AA68;
  v20 = &unk_1E2C63280;
  v21 = self;
  v22 = v11;
  v15 = v11;
  v16 = (void *)MEMORY[0x19400FE1C](&v17);
  if ((_IDSRunningInDaemon() & 1) != 0)
    -[IDSBAASigner headersBySigningDataNoXPC:serverTimestamp:completion:](self, "headersBySigningDataNoXPC:serverTimestamp:completion:", v13, v12, v16, v17, v18, v19, v20, v21, v22);
  else
    -[IDSBAASigner headersBySigningDataXPC:serverTimestamp:topic:completion:](self, "headersBySigningDataXPC:serverTimestamp:topic:completion:", v13, v12, v10, v16, v17, v18, v19, v20, v21, v22);

}

- (void)headersBySigningDataXPC:(id)a3 serverTimestamp:(id)a4 topic:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[IDSBAASigner queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v26 = v12;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "XPCing BAA sign {topic: %@, serverTimestamp: %@, data: %@}", buf, 0x20u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_19076AD18;
  v20[3] = &unk_1E2C632A8;
  v21 = v12;
  v22 = v10;
  v23 = v11;
  v24 = v13;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  v19 = v12;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v20);

}

- (void)headersBySigningDataNoXPC:(id)a3 serverTimestamp:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  IDSBAASigner *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IDSBAASigner queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19076AF18;
  v15[3] = &unk_1E2C632F8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[IDSBAASigner fetchBAAIdentityIfNeededWithCompletion:](self, "fetchBAAIdentityIfNeededWithCompletion:", v15);

}

- (void)purgeBAACertForTopic:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_purgeBAACertForTopic_completion_);
}

- (void)purgeBAACertForTopic:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((_IDSRunningInDaemon() & 1) != 0)
    -[IDSBAASigner purgeBAACertNoXPCWithCompletion:](self, "purgeBAACertNoXPCWithCompletion:", v6);
  else
    -[IDSBAASigner purgeBAACertXPCForTopic:completion:](self, "purgeBAACertXPCForTopic:completion:", v7, v6);

}

- (void)purgeBAACertXPCForTopic:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19076B580;
  v9[3] = &unk_1E2C61618;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[IDSXPCDaemonController performDaemonControllerTask:](IDSXPCDaemonController, "performDaemonControllerTask:", v9);

}

- (void)purgeBAACertNoXPCWithCompletion:(id)a3
{
  id v4;
  void **v5;
  void *v6;
  uint64_t v7;
  void **v8;
  void *v9;
  NSObject *v10;
  void (*v11)(void *, NSObject *, _QWORD *);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1EE1E1FE8 != -1)
    dispatch_once(&qword_1EE1E1FE8, &unk_1E2C5FBD0);
  if (!qword_1EE1E1FF0)
  {
    v5 = (void **)MEMORY[0x19400F258]("kMAOptionsBAAKeychainLabel", CFSTR("DeviceIdentity"));
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&qword_1EE1E1FF0, v6);
  }
  v7 = qword_1EE1E1FF8;
  if (!qword_1EE1E1FF8)
  {
    v8 = (void **)MEMORY[0x19400F258]("kMAOptionsBAADeleteExistingKeysAndCerts", CFSTR("DeviceIdentity"));
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&qword_1EE1E1FF8, v9);
    v7 = qword_1EE1E1FF8;
  }
  if (off_1EE1E1FE0 && qword_1EE1E1FF0 && v7)
  {
    v22[0] = qword_1EE1E1FF0;
    v22[1] = v7;
    v23[0] = CFSTR("com.apple.IDS");
    v23[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void (*)(void *, NSObject *, _QWORD *))off_1EE1E1FE0;
    -[IDSBAASigner baaQueue](self, "baaQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19076B8C8;
    v20[3] = &unk_1E2C63320;
    v21 = v4;
    v11(v12, v10, v20);

  }
  else
  {
    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1907F199C(v10, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (BOOL)isDeviceIdentitySupported
{
  BOOL result;

  if (qword_1EE1E1F38 != -1)
    dispatch_once(&qword_1EE1E1F38, &unk_1E2C63340);
  result = (char)off_1EE1E1F30;
  if (off_1EE1E1F30)
    return off_1EE1E1F30();
  return result;
}

- (void)fetchBAAIdentityIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, int);
  void *v23;
  IDSBAASigner *v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  IDSBAASigner *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  uint8_t buf[4];
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IDSBAASigner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[IDSBAASigner isDeviceIdentitySupported](self, "isDeviceIdentitySupported"))
  {
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_1906EE294;
    v37[4] = sub_1906EE11C;
    v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_1906EE294;
    v35[4] = sub_1906EE11C;
    v36 = 0;
    -[IDSBAASigner baaCertTTLInMinutesFromServerBag](self, "baaCertTTLInMinutesFromServerBag");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &unk_1E2CAE5A0;
    if (v6)
      v8 = (void *)v6;
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_19076BD60;
    v29[3] = &unk_1E2C633D8;
    v11 = v9;
    v30 = v11;
    v31 = self;
    v32 = v39;
    v33 = v37;
    v34 = v35;
    v12 = (void *)MEMORY[0x19400FE1C](v29);
    v20 = v10;
    v21 = 3221225472;
    v22 = sub_19076C500;
    v23 = &unk_1E2C63428;
    v24 = self;
    v26 = v39;
    v27 = v37;
    v28 = v35;
    v25 = v4;
    v13 = (void *)MEMORY[0x19400FE1C](&v20);
    -[IDSBAASigner baaFetchTimeoutFromServerBag](self, "baaFetchTimeoutFromServerBag", v20, v21, v22, v23, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      v17 = v16;
    }
    else
    {
      v17 = 60.0;
    }
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v41 = v17;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Starting device identity fetch task with timeout {timeoutInSeconds: %f}", buf, 0xCu);
    }

    dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    im_dispatch_async_with_timeout();

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);

    _Block_object_dispose(v39, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IDSBAASignerErrorDomain"), 8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v18);

  }
}

- (id)baaCertTTLInMinutesFromServerBag
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("absinthe-baa-cert-ttl-minutes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)baaFetchTimeoutFromServerBag
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("absinthe-baa-timeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)signData:(id)a3 withKey:(__SecKey *)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, IDSBAASigningResult *);
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  IDSBAASigningResult *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  IDSBAASigningResult *v31;
  IDSBAASigningResult *v32;
  IDSBAASigningResult *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD block[4];
  IDSBAASigningResult *v41;
  id v42;
  IDSBAASigner *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void (**v53)(id, IDSBAASigningResult *);
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, IDSBAASigningResult *))a5;
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 5;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isUnderFirstDataProtectionLock");

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = 7;
LABEL_5:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("IDSBAASignerErrorDomain"), v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = -[IDSBAASigningResult initWithResultData:timestamp:error:]([IDSBAASigningResult alloc], "initWithResultData:timestamp:error:", 0, 0, v14);
    v9[2](v9, v15);

    goto LABEL_6;
  }
  objc_msgSend(v8, "sha256Digest");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v58 = 0;
    v59 = 0;
    -[IDSBAASigner legacySignData:withKey:signingTimestamp:error:](self, "legacySignData:withKey:signingTimestamp:error:", v8, a4, &v59, &v58);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v59;
    v14 = v58;
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  if (_os_feature_enabled_impl())
  {
    v35 = v17;
    v57 = 0;
    -[IDSBAASigner alternateICloudSigningPayloadForData:currentTimestampInMs:](self, "alternateICloudSigningPayloadForData:currentTimestampInMs:", v8, &v57);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestBody");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v18;
    if (v19)
    {
      -[IDSBAASigner icloudSigningPayloadForData:withAltPayload:](self, "icloudSigningPayloadForData:withAltPayload:", v8, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v34 = v16;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v20;
      _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "BAA signer payload %@", buf, 0xCu);
    }

    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "SHA256Data");
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "SHA256Data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0;
    v36 = v25;
    -[IDSBAASigner icloudSignData:withKey:error:](self, "icloudSignData:withKey:error:", v25, a4, &v56);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v23;
    v38 = v56;
    v55 = 0;
    -[IDSBAASigner icloudSignData:withKey:error:](self, "icloudSignData:withKey:error:", v23, a4, &v55);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v55;
    if (-[IDSBAASigner isVirtualMachine](self, "isVirtualMachine"))
    {
      -[IDSBAASigner baaQueue](self, "baaQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19076CCFC;
      block[3] = &unk_1E2C634B8;
      v41 = v25;
      v42 = v37;
      v43 = self;
      v53 = v9;
      v29 = v34;
      v44 = v34;
      v30 = v35;
      v45 = v35;
      v46 = v14;
      v54 = v57;
      v47 = v20;
      v48 = v18;
      v49 = v39;
      v50 = v26;
      v51 = v38;
      v52 = v27;
      dispatch_async(v28, block);

      v31 = v41;
    }
    else
    {
      v33 = [IDSBAASigningResult alloc];
      v29 = v34;
      v30 = v35;
      v31 = -[IDSBAASigningResult initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:](v33, "initWithResultData:timestamp:error:currentTimestampInMs:icloudDigest:icloudAltDigest:icloudResultData:icloudAltResultData:icloudError:icloudAltError:", v34, v35, v14, v57, v20, v18, v39, v26, v38, v27);
      v9[2](v9, v31);
    }

  }
  else
  {
    v32 = -[IDSBAASigningResult initWithResultData:timestamp:error:]([IDSBAASigningResult alloc], "initWithResultData:timestamp:error:", v16, v17, v14);
    v9[2](v9, v32);

  }
LABEL_6:

}

- (id)legacySignData:(id)a3 withKey:(__SecKey *)a4 signingTimestamp:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFData *v20;
  CFDataRef v21;
  NSObject *v22;
  CFErrorRef v23;
  uint8_t buf[16];
  CFErrorRef error;
  unint64_t v27;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11;

  objc_msgSend(v9, "serverTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "serverTimestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v12 = v15 / 1000.0;

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), (unint64_t)(v12 * 1000.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = bswap64((unint64_t)(v12 * 1000.0));
  objc_msgSend(v9, "sha256Digest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "appendBytes:length:", &v27, 8);
  error = 0;
  v19 = (const __CFString *)*MEMORY[0x1E0CD6DF8];
  v20 = (const __CFData *)objc_msgSend(v18, "copy");
  v21 = SecKeyCreateSignature(a4, v19, v20, &error);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "Successfully signed legacy baa data in baa signer", buf, 2u);
    }
    v23 = 0;
  }
  else
  {
    v23 = error;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_1907F1AA8();
  }

  if (a6)
    *a6 = objc_retainAutorelease(v23);
  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v21;
}

- (id)icloudSignData:(id)a3 withKey:(__SecKey *)a4 error:(id *)a5
{
  const __CFString *v7;
  const __CFData *v8;
  CFDataRef v9;
  NSObject *v10;
  CFErrorRef v11;
  uint8_t v13[8];
  CFErrorRef error;

  error = 0;
  v7 = (const __CFString *)*MEMORY[0x1E0CD6DF8];
  v8 = (const __CFData *)objc_msgSend(a3, "copy");
  v9 = SecKeyCreateSignature(a4, v7, v8, &error);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Successfully signed baa data in baa signer", v13, 2u);
    }
    v11 = 0;
  }
  else
  {
    v11 = error;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1907F1B08();
  }

  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v9;
}

- (id)icloudSigningPayloadForData:(id)a3 withAltPayload:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "requestBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SHA256Data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__imHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)alternateICloudSigningPayloadForData:(id)a3 currentTimestampInMs:(unint64_t *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  objc_msgSend(v6, "serverTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = (unint64_t)(v9 * 1000.0);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v6, "serverTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedLongLongValue");

  if (a4)
LABEL_3:
    *a4 = v12;
LABEL_4:
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSBAASigner icloudBAAVersion](self, "icloudBAAVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("|%@=%@|%@=%@"), CFSTR("x-apple-baa-time"), v14, CFSTR("x-apple-baa-version"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)isBAASupportedHeaderValue
{
  if (-[IDSBAASigner isDeviceIdentitySupported](self, "isDeviceIdentitySupported"))
    return CFSTR("1");
  else
    return CFSTR("0");
}

- (BOOL)isBAAProtocolHeader:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (qword_1EE1E1EE0 != -1)
    dispatch_once(&qword_1EE1E1EE0, &unk_1E2C634D8);
  if ((objc_msgSend((id)qword_1EE1E1ED8, "containsObject:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("x-apple-baa"));

  return v4;
}

+ (BOOL)shouldRetryError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  unsigned int v8;

  v3 = a3;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("IDSBAASignerErrorDomain")),
        v5,
        v6))
  {
    v7 = objc_msgSend(v4, "code");
    if (v7 <= 8)
      v8 = (0x12u >> v7) & 1;
    else
      LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (BOOL)isBAAHTTPResponseCode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 440;
}

- (id)headersBySigningData:(id)a3 baaSigningResult:(id)a4 baaCert:(id)a5 intermediateRootCert:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  id v57;
  void *v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v58, "appendData:", v13);
  objc_msgSend(v10, "sha256Digest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v10, "sha256Digest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v10;
    if (v17)
    {
      CFDictionarySetValue(v14, CFSTR("baa-message"), v17);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1907F2168();
    }

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "resultData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestamp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@:%@"), v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
    if (v24)
    {
      CFDictionarySetValue(v14, CFSTR("baa-signature"), v24);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1907F20E8();
    }

    objc_msgSend(v58, "base64EncodedStringWithOptions:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    if (v25)
    {
      CFDictionarySetValue(v14, CFSTR("baa-certs"), v25);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1907F2068();
    }

  }
  if (_os_feature_enabled_impl())
  {
    -[IDSBAASigner icloudBAAVersion](self, "icloudBAAVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      CFDictionarySetValue(v14, CFSTR("x-apple-baa-version"), v27);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1907F1FE8();
    }

    if (v12 && v13)
    {
      v59[0] = v12;
      v59[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      IDSPEMFormatCertificates();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        CFDictionarySetValue(v14, CFSTR("x-apple-baa-cert"), v29);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1907F1F68();
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "currentTimestampInMs"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      CFDictionarySetValue(v14, CFSTR("x-apple-baa-time"), v31);

    objc_msgSend(v11, "icloudAltResultData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v11, "icloudAltResultData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        CFDictionarySetValue(v14, CFSTR("x-apple-baa-sig-alt"), v34);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1907F1EE8();
      }

    }
    objc_msgSend(v11, "icloudResultData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v11, "icloudResultData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "base64EncodedStringWithOptions:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        CFDictionarySetValue(v14, CFSTR("x-apple-baa-sig"), v37);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1907F1E68();
      }

    }
    -[IDSBAASigner errorStringForSingingResult:](self, "errorStringForSingingResult:", v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "length"))
    {
      v39 = v38;
      if (v39)
      {
        CFDictionarySetValue(v14, CFSTR("x-apple-baa-error"), v39);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sub_1907F1DE8();
      }

    }
    if (-[IDSBAASigner isVirtualMachine](self, "isVirtualMachine"))
    {
      objc_msgSend(v11, "hostCertChain");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = v10;
        objc_msgSend(v11, "hostCertChain");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        IDSParseDERCertificatesFromChain();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        IDSPEMFormatCertificates();
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v44;
        if (v45)
        {
          CFDictionarySetValue(v14, CFSTR("x-apple-baa-host-cert"), v45);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907F1D68();
        }

        v10 = v41;
      }
      objc_msgSend(v11, "hostAltResultData");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        objc_msgSend(v11, "hostAltResultData");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "base64EncodedStringWithOptions:", 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          CFDictionarySetValue(v14, CFSTR("x-apple-baa-host-sig-alt"), v48);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907F1CE8();
        }

      }
      v57 = v10;
      objc_msgSend(v11, "hostResultData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v11, "hostResultData");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "base64EncodedStringWithOptions:", 0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          CFDictionarySetValue(v14, CFSTR("x-apple-baa-host-sig"), v51);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907F1C68();
        }

      }
      -[IDSBAASigner hostErrorStringForSingingResult:](self, "hostErrorStringForSingingResult:", v11);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "length"))
      {
        v53 = v52;
        if (v53)
        {
          CFDictionarySetValue(v14, CFSTR("x-apple-baa-host-error"), v53);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          sub_1907F1BE8();
        }

      }
      v10 = v57;
    }
    if (-[IDSBAASigner isVirtualMachine](self, "isVirtualMachine"))
      v54 = CFSTR("2");
    else
      v54 = CFSTR("1");
    CFDictionarySetValue(v14, CFSTR("x-apple-i-device-type"), v54);
    -[IDSBAASigner isBAASupportedHeaderValue](self, "isBAASupportedHeaderValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      CFDictionarySetValue(v14, CFSTR("x-apple-baa-supported"), v55);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1907F1B68();
    }

  }
  return v14;
}

- (id)errorStringForNSErrorWithoutUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":,"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByRemovingCharactersFromSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "code");

    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:%ld:%@"), v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "code");

    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%ld"), v8, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)errorStringForNSError:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = v4;
  if (v4)
  {
    v5 = v4;
    -[IDSBAASigner errorStringForNSErrorWithoutUnderlyingError:](self, "errorStringForNSErrorWithoutUnderlyingError:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "underlyingErrors");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        obj = v8;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
        {
          v10 = v9;
          v8 = 0;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            v13 = v6;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
              v15 = (void *)MEMORY[0x1E0CB3940];
              -[IDSBAASigner errorStringForNSErrorWithoutUnderlyingError:](self, "errorStringForNSErrorWithoutUnderlyingError:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", CFSTR(",%@"), v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v17);
              v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "underlyingErrors");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (v8)
              {
                objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v18);
                v20 = objc_claimAutoreleasedReturnValue();

                v8 = (void *)v20;
              }
              else
              {
                v8 = (void *)v18;
              }
              ++v12;
              v13 = v6;
            }
            while (v10 != v12);
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v10);
        }
        else
        {
          v8 = 0;
        }

      }
      while (v8);
    }
  }
  else
  {
    v6 = &stru_1E2C65AE8;
  }

  return v6;
}

- (id)errorStringForSingingResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "icloudError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "icloudError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBAASigner errorStringForNSError:](self, "errorStringForNSError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E2C65AE8, "stringByAppendingString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "icloudAltError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(","));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_1E2C65AE8;
    }

    objc_msgSend(v4, "icloudAltError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBAASigner errorStringForNSError:](self, "errorStringForNSError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)hostErrorStringForSingingResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "hostError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "hostError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBAASigner errorStringForNSError:](self, "errorStringForNSError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E2C65AE8, "stringByAppendingString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "hostAltError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(","));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_1E2C65AE8;
    }

    objc_msgSend(v4, "hostAltError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBAASigner errorStringForNSError:](self, "errorStringForNSError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)icloudBAAVersion
{
  return &unk_1E2CAE2A0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)baaQueue
{
  return self->_baaQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
