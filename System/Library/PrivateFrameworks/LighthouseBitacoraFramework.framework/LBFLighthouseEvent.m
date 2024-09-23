@implementation LBFLighthouseEvent

- (LBFLighthouseEvent)initWithPerformTaskStatus:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFLighthouseEvent *v10;
  uint64_t v11;
  NSNumber *succeeded;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *errorDomain;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSNumber *errorCode;
  NSString *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *usePrivateUpload;
  objc_super v37;

  v4 = a3;
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = -[LBFLighthouseEvent init](&v37, sel_init);
  if (v10)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v7, v4, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      objc_msgSend_domain(v6, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = (void *)MEMORY[0x24BDD16E0];
      v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v31, 0, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 1;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFLighthouseEvent *v10;
  uint64_t v11;
  NSNumber *succeeded;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *errorDomain;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSNumber *errorCode;
  NSString *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *usePrivateUpload;
  objc_super v37;

  v4 = a3;
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = -[LBFLighthouseEvent init](&v37, sel_init);
  if (v10)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v7, v4, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      objc_msgSend_domain(v6, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = (void *)MEMORY[0x24BDD16E0];
      v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v31, 0, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 2;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithStop:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFLighthouseEvent *v10;
  uint64_t v11;
  NSNumber *succeeded;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *errorDomain;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSNumber *errorCode;
  NSString *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *usePrivateUpload;
  objc_super v37;

  v4 = a3;
  v6 = a4;
  v37.receiver = self;
  v37.super_class = (Class)LBFLighthouseEvent;
  v10 = -[LBFLighthouseEvent init](&v37, sel_init);
  if (v10)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v7, v4, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    succeeded = v10->_succeeded;
    v10->_succeeded = (NSNumber *)v11;

    if (v6)
    {
      objc_msgSend_domain(v6, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      errorDomain = v10->_errorDomain;
      v10->_errorDomain = (NSString *)v17;

      v19 = (void *)MEMORY[0x24BDD16E0];
      v24 = objc_msgSend_code(v6, v20, v21, v22, v23);
      objc_msgSend_numberWithInteger_(v19, v25, v24, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      errorCode = v10->_errorCode;
      v10->_errorCode = (NSNumber *)v28;
    }
    else
    {
      v30 = v10->_errorDomain;
      v10->_errorDomain = 0;

      errorCode = v10->_errorCode;
      v10->_errorCode = 0;
    }

    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v31, 0, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    usePrivateUpload = v10->_usePrivateUpload;
    v10->_usePrivateUpload = (NSNumber *)v34;

    v10->_eventType = 3;
  }

  return v10;
}

- (LBFLighthouseEvent)initWithPerformTrialTaskStatus:(BOOL)a3 error:(id)a4 usePrivateUpload:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  LBFLighthouseEvent *v12;
  uint64_t v13;
  NSNumber *succeeded;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *errorDomain;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *errorCode;
  NSString *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *usePrivateUpload;
  objc_super v39;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)LBFLighthouseEvent;
  v12 = -[LBFLighthouseEvent init](&v39, sel_init);
  if (v12)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v9, v6, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    succeeded = v12->_succeeded;
    v12->_succeeded = (NSNumber *)v13;

    if (v8)
    {
      objc_msgSend_domain(v8, v15, v16, v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      errorDomain = v12->_errorDomain;
      v12->_errorDomain = (NSString *)v19;

      v21 = (void *)MEMORY[0x24BDD16E0];
      v26 = objc_msgSend_code(v8, v22, v23, v24, v25);
      objc_msgSend_numberWithInteger_(v21, v27, v26, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      errorCode = v12->_errorCode;
      v12->_errorCode = (NSNumber *)v30;
    }
    else
    {
      v32 = v12->_errorDomain;
      v12->_errorDomain = 0;

      errorCode = v12->_errorCode;
      v12->_errorCode = 0;
    }

    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v33, v5, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    usePrivateUpload = v12->_usePrivateUpload;
    v12->_usePrivateUpload = (NSNumber *)v36;

    v12->_eventType = 2;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  LBFLighthouseEvent *v4;
  LBFLighthouseEvent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char IsEqualNumberOrNil_n2;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  char IsEqualStringOrNil_s2;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  NSObject *v55;

  v4 = (LBFLighthouseEvent *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_8;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v55 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315A78(v55);
    goto LABEL_11;
  }
  objc_msgSend_succeeded(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_succeeded(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v16, (uint64_t)v10, (uint64_t)v15, v17);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315C70();
    goto LABEL_11;
  }
  objc_msgSend_errorCode(v5, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(self, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v29, (uint64_t)v23, (uint64_t)v28, v30);

  if ((v31 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315BDC();
    goto LABEL_11;
  }
  objc_msgSend_errorDomain(v5, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDomain(self, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqualStringOrNil_s2 = objc_msgSend_IsEqualStringOrNil_s2_(LBFUtils, v42, (uint64_t)v36, (uint64_t)v41, v43);

  if ((IsEqualStringOrNil_s2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315B48();
    goto LABEL_11;
  }
  v49 = objc_msgSend_eventType(v5, v45, v46, v47, v48);
  if (v49 != objc_msgSend_eventType(self, v50, v51, v52, v53))
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315AB8();
LABEL_11:
    v54 = 0;
    goto LABEL_12;
  }
LABEL_8:
  v54 = 1;
LABEL_12:

  return v54;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)usePrivateUpload
{
  return self->_usePrivateUpload;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usePrivateUpload, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
}

@end
