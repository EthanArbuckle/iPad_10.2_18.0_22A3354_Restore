@implementation CLSUserDefaults

+ (Class)endpointClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedDefaults
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isEqualToString;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_executablePath(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_lastPathComponent(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("progressd"));

  if (isEqualToString)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v13 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D4054000, v13, OS_LOG_TYPE_FAULT, "ERROR: CLSUserDefaults is not available to progressd", buf, 2u);
    }
    v14 = 0;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D4068D4C;
    block[3] = &unk_1E9749D50;
    block[4] = a1;
    if (qword_1ED0FB3A8 != -1)
      dispatch_once(&qword_1ED0FB3A8, block);
    v14 = (id)qword_1ED0FB3A0;
  }

  return v14;
}

+ (id)displayNameForDefaultName:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = v3;
  if (qword_1ED0FB3B8 != -1)
  {
    dispatch_once(&qword_1ED0FB3B8, &unk_1E9749950);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1ED0FB3B0, v4, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v6;
}

- (CLSUserDefaults)initWithEndpoint:(id)a3
{
  id v4;
  const char *v5;
  CLSUserDefaults *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  CLSUserDefaults *v11;
  int v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  CLSEndpointConnection *endpointConnection;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  objc_super v30;
  uint64_t v31;
  id v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CLSUserDefaults;
  v6 = -[CLSUserDefaults init](&v30, sel_init);
  if (!v6)
  {
LABEL_9:
    v11 = v6;
    goto LABEL_10;
  }
  v32 = 0;
  objc_msgSend_entitlementsForCurrentTaskWithError_(CLSEntitlements, v5, (uint64_t)&v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (v8)
  {
    v10 = v8;

    v11 = 0;
    goto LABEL_10;
  }
  v31 = 0;
  v12 = objc_msgSend_BOOLValueForEntitlement_error_(v7, v9, (uint64_t)CFSTR("com.apple.private.ClassKit.dashboard"), &v31);
  v13 = v31;

  v11 = 0;
  if (!v13 && v12)
  {
    v14 = (void *)objc_opt_class();
    v17 = (void *)objc_msgSend_endpointClass(v14, v15, v16);
    objc_msgSend_instanceForEndpoint_(v17, v18, (uint64_t)v4);
    v19 = objc_claimAutoreleasedReturnValue();
    endpointConnection = v6->_endpointConnection;
    v6->_endpointConnection = (CLSEndpointConnection *)v19;

    CLSDispatchQueueName(v6, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB3C8 != -1)
      dispatch_once(&qword_1ED0FB3C8, &unk_1E974A010);
    v26 = (id)qword_1ED0FB3C0;
    v27 = dispatch_queue_create_with_target_V2(v24, v25, v26);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v27;

    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (id)utilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_utilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)syncUtilityServer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_endpointConnection(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_syncUtilityServer_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)userDefaultsConfigurationDictionaryWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D4069170;
  v9[3] = &unk_1E9749F88;
  v10 = v4;
  v5 = v4;
  objc_msgSend_utilityServer_(self, v6, (uint64_t)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getUserDefaultsConfigurationDictionaryWithCompletion_(v7, v8, (uint64_t)v5);

}

- (void)getUserDefaultForDefaultNamed:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D406922C;
  v12[3] = &unk_1E9749F88;
  v13 = v6;
  v7 = v6;
  v8 = a3;
  objc_msgSend_utilityServer_(self, v9, (uint64_t)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_getUserDefaultForDefaultNamed_completion_(v10, v11, (uint64_t)v8, v7);

}

- (void)setUserDefaultValue:(id)a3 forDefaultNamed:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1D40692FC;
  v15[3] = &unk_1E9749F88;
  v16 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  objc_msgSend_utilityServer_(self, v12, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_setUserDefaultValue_forDefaultNamed_completion_(v13, v14, (uint64_t)v11, v10, v9);

}

- (BOOL)userDefaultForDefaultNamed:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  char v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend_syncUtilityServer_(self, v5, (uint64_t)&unk_1E9749FC8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D40694BC;
  v10[3] = &unk_1E9749FF0;
  v10[4] = &v11;
  objc_msgSend_remote_getUserDefaultForDefaultNamed_completion_(v6, v7, (uint64_t)v4, v10);
  v8 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (CLSEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
