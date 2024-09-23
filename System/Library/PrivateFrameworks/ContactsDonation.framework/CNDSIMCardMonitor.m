@implementation CNDSIMCardMonitor

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_0);
  return (id)os_log_cn_once_object_1;
}

void __27__CNDSIMCardMonitor_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.donation", "sim");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

- (CNDSIMCardMonitor)init
{
  id v3;
  CNDCoreTelephonyServices *v4;
  CNDSIMCardMonitor *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v4 = objc_alloc_init(CNDCoreTelephonyServices);
  v5 = -[CNDSIMCardMonitor initWithCoreTelephonyClient:services:](self, "initWithCoreTelephonyClient:services:", v3, v4);

  return v5;
}

- (CNDSIMCardMonitor)initWithCoreTelephonyClient:(id)a3 services:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CNDSIMCardMonitor *v25;
  CNDSIMCardMonitor *v26;
  id v27;
  void *v28;
  uint64_t v29;
  CNReplaySubject *subject;
  CNDSIMCardMonitor *v31;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  if (v7)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_122);
  v9 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
  {
    -[CNDSIMCardMonitor initWithCoreTelephonyClient:services:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    if (v8)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v8)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_122);
  v17 = CNGuardOSLog_cn_once_object_0_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT))
    -[CNDSIMCardMonitor initWithCoreTelephonyClient:services:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_10:
  v33.receiver = self;
  v33.super_class = (Class)CNDSIMCardMonitor;
  v25 = -[CNDSIMCardMonitor init](&v33, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_coreTelephonyClient, a3);
    objc_storeStrong((id *)&v26->_coreTelephonyServices, a4);
    v27 = objc_alloc(MEMORY[0x24BE192C8]);
    objc_msgSend(MEMORY[0x24BE192D0], "defaultProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithCapacity:schedulerProvider:", 1, v28);
    subject = v26->_subject;
    v26->_subject = (CNReplaySubject *)v29;

    v31 = v26;
  }

  return v26;
}

- (void)dealloc
{
  __CTServerConnection *serverConnection;
  objc_super v4;

  serverConnection = self->_serverConnection;
  if (serverConnection)
    CFRelease(serverConnection);
  -[CNCancelable cancel](self->_subjectToken, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)CNDSIMCardMonitor;
  -[CNDSIMCardMonitor dealloc](&v4, sel_dealloc);
}

- (void)setServerConnection:(__CTServerConnection *)a3
{
  __CTServerConnection *v4;

  if (self->_serverConnection != a3)
  {
    if (a3)
      v4 = (__CTServerConnection *)CFRetain(a3);
    else
      v4 = 0;
    self->_serverConnection = v4;
  }
}

- (id)addInfoChangeHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CNDSIMCardMonitor configureStateIfNecessary](self, "configureStateIfNecessary");
  -[CNDSIMCardMonitor subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE192A8], "observerWithResultBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subscribe:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)configureStateIfNecessary
{
  CNDSIMCardMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CNDSIMCardMonitor nts_configureConnectionIfNecessary](obj, "nts_configureConnectionIfNecessary");
  -[CNDSIMCardMonitor nts_configureSubjectIfNecessary](obj, "nts_configureSubjectIfNecessary");
  objc_sync_exit(obj);

}

- (void)nts_configureConnectionIfNecessary
{
  dispatch_queue_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (!self->_serverConnection)
  {
    v3 = dispatch_queue_create("com.apple.contacts.ContactsDonation.CNDSIMCardMonitor", 0);
    -[CNDSIMCardMonitor setServerConnectionQueue:](self, "setServerConnectionQueue:", v3);

    -[CNDSIMCardMonitor coreTelephonyServices](self, "coreTelephonyServices");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDBD240];
    -[CNDSIMCardMonitor serverConnectionQueue](self, "serverConnectionQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDSIMCardMonitor setServerConnection:](self, "setServerConnection:", objc_msgSend(v6, "_CTServerConnectionCreateOnTargetQueue::::", v4, CFSTR("com.apple.contacts.ContactsDonation.CNDSIMCardMonitor"), v5, 0));

  }
}

- (void)nts_configureSubjectIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNDSIMCardMonitor subjectToken](self, "subjectToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_class();
    -[CNDSIMCardMonitor coreTelephonyClient](self, "coreTelephonyClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDSIMCardMonitor coreTelephonyServices](self, "coreTelephonyServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "continuousPhoneNumberObservableWithCoreTelephonyClient:services:serverConnection:", v5, v6, -[CNDSIMCardMonitor serverConnection](self, "serverConnection"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[CNDSIMCardMonitor subject](self, "subject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscribe:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNDSIMCardMonitor setSubjectToken:](self, "setSubjectToken:", v8);

  }
}

+ (id)continuousPhoneNumberObservableWithCoreTelephonyClient:(id)a3 services:(id)a4 serverConnection:(__CTServerConnection *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  objc_msgSend(a1, "phoneNumberChangedObservableWithCoreTelephonyServices:serverConnection:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startWith:", &unk_24C23B9A0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__CNDSIMCardMonitor_continuousPhoneNumberObservableWithCoreTelephonyClient_services_serverConnection___block_invoke;
  v14[3] = &unk_24C235FE8;
  v15 = v8;
  v16 = a1;
  v11 = v8;
  objc_msgSend(v10, "concatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __102__CNDSIMCardMonitor_continuousPhoneNumberObservableWithCoreTelephonyClient_services_serverConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "phoneNumberObservableWithCoreTelephonyClient:", *(_QWORD *)(a1 + 32));
}

+ (id)phoneNumberChangedObservableWithCoreTelephonyServices:(id)a3 serverConnection:(__CTServerConnection *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  __CTServerConnection *v12;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BE192A0];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke;
  v10[3] = &unk_24C236060;
  v11 = v5;
  v12 = a4;
  v7 = v5;
  objc_msgSend(v6, "observableWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x24BDAC760];
  v7 = *MEMORY[0x24BDC3020];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_2;
  v17[3] = &unk_24C236010;
  v18 = v3;
  v8 = v3;
  objc_msgSend(v4, "_CTServerConnectionRegisterBlockForNotification:::", v5, v7, v17);
  v9 = (void *)MEMORY[0x24BE19230];
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_3;
  v14[3] = &unk_24C236038;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  objc_msgSend(v9, "tokenWithCancelationBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", CFSTR("change"));
}

uint64_t __92__CNDSIMCardMonitor_phoneNumberChangedObservableWithCoreTelephonyServices_serverConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_CTServerConnectionUnregisterForNotification::", *(_QWORD *)(a1 + 40), *MEMORY[0x24BDC3020]);
}

+ (id)phoneNumberObservableWithCoreTelephonyClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE192A0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke;
  v9[3] = &unk_24C236060;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE19230]);
  v7 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v7 + 8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_2;
  v13[3] = &unk_24C2360B0;
  v8 = v4;
  v14 = v8;
  v15 = v3;
  v9 = v3;
  objc_msgSend(v6, "infoWithClient:completion:", v5, v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_3;
  v10[3] = &unk_24C236088;
  v11 = v5;
  v12 = v6;
  v7 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __66__CNDSIMCardMonitor_phoneNumberObservableWithCoreTelephonyClient___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x24BE192A8], "sendResult:error:toObserver:", a1[4], a1[5], a1[6]);
}

+ (id)infoWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDC2810]);
  v6 = objc_alloc_init(MEMORY[0x24BE19230]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke;
  v12[3] = &unk_24C236100;
  v7 = v6;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  objc_msgSend(a1, "infoWithClient:completion:", v5, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke_2;
  v11[3] = &unk_24C2360D8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "performBlock:", v11);

}

uint64_t __40__CNDSIMCardMonitor_infoWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)infoWithClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke;
  v10[3] = &unk_24C236150;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "getSubscriptionInfo:", v10);

}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CNDSIMCardItem *(*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "subscriptionsInUse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20;
    v22 = &unk_24C236128;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v23 = v7;
    v24 = v8;
    objc_msgSend(v6, "_cn_compactMap:", &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "os_log", v19, v20, v21, v22);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v26 = v11;
      _os_log_impl(&dword_209C22000, v10, OS_LOG_TYPE_INFO, "Read %lu values from SIM", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_cold_1((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

CNDSIMCardItem *__47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  CNDSIMCardItem *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CNDSIMCardItem *v29;
  void *v30;
  __int16 v32[8];
  id v33;
  id v34;

  v3 = a2;
  if ((objc_msgSend(v3, "isSimHidden") & 1) == 0 && (objc_msgSend(v3, "isSimDataOnly") & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    v34 = 0;
    objc_msgSend(v5, "getSimLabel:error:", v3, &v34);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
      goto LABEL_10;
    }
    v8 = *MEMORY[0x24BE191D0];
    objc_msgSend(v6, "unique_id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_2(v11);
LABEL_10:
      v4 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v18 = *(void **)(a1 + 32);
    v33 = 0;
    objc_msgSend(v18, "getPhoneNumber:error:", v3, &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v33;
    if (v19)
    {
      objc_msgSend(v19, "number");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v20);

      if (!v21)
      {
        v29 = [CNDSIMCardItem alloc];
        objc_msgSend(v6, "unique_id");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "number");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[CNDSIMCardItem initWithIdentifier:value:](v29, "initWithIdentifier:value:", v22, v30);

        goto LABEL_19;
      }
      objc_msgSend(*(id *)(a1 + 40), "os_log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v32[0] = 0;
        _os_log_impl(&dword_209C22000, v22, OS_LOG_TYPE_INFO, "No phone number for passed in subscription, skipping.", (uint8_t *)v32, 2u);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "os_log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_3((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
    }
    v4 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v4 = 0;
LABEL_21:

  return v4;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CNDCoreTelephonyServices)coreTelephonyServices
{
  return self->_coreTelephonyServices;
}

- (CNReplaySubject)subject
{
  return self->_subject;
}

- (CNCancelable)subjectToken
{
  return self->_subjectToken;
}

- (void)setSubjectToken:(id)a3
{
  objc_storeStrong((id *)&self->_subjectToken, a3);
}

- (__CTServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (OS_dispatch_queue)serverConnectionQueue
{
  return self->_serverConnectionQueue;
}

- (void)setServerConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnectionQueue, 0);
  objc_storeStrong((id *)&self->_subjectToken, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_coreTelephonyServices, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)initWithCoreTelephonyClient:(uint64_t)a3 services:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘services’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCoreTelephonyClient:(uint64_t)a3 services:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘client’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209C22000, a2, a3, "Could not get subscription information: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209C22000, a2, a3, "Skipping subscription because there was an error fetching the label: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209C22000, log, OS_LOG_TYPE_ERROR, "Skipping subscription with no identifier", v1, 2u);
  OUTLINED_FUNCTION_3();
}

void __47__CNDSIMCardMonitor_infoWithClient_completion___block_invoke_20_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_209C22000, a2, a3, "Skipping subscription because there was an error fetching the phone number: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
