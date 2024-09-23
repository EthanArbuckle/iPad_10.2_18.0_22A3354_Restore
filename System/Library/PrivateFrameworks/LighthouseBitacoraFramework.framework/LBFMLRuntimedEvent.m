@implementation LBFMLRuntimedEvent

- (LBFMLRuntimedEvent)initWithTaskFetched:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFMLRuntimedEvent *v10;
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
  objc_super v32;

  v4 = a3;
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = -[LBFMLRuntimedEvent init](&v32, sel_init);
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

    v10->_eventType = 2;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithTaskScheduled:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFMLRuntimedEvent *v10;
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
  objc_super v32;

  v4 = a3;
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = -[LBFMLRuntimedEvent init](&v32, sel_init);
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

    v10->_eventType = 3;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithTaskCompleted:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  LBFMLRuntimedEvent *v10;
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
  objc_super v32;

  v4 = a3;
  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)LBFMLRuntimedEvent;
  v10 = -[LBFMLRuntimedEvent init](&v32, sel_init);
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

    v10->_eventType = 4;
  }

  return v10;
}

- (LBFMLRuntimedEvent)initWithScheduleStatus:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  LBFMLRuntimedEvent *v7;
  uint64_t v8;
  NSNumber *scheduled;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFMLRuntimedEvent;
  v7 = -[LBFMLRuntimedEvent init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, v3, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    scheduled = v7->_scheduled;
    v7->_scheduled = (NSNumber *)v8;

    v7->_eventType = 1;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LBFMLRuntimedEvent *v4;
  LBFMLRuntimedEvent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char IsEqualNumberOrNil_n2;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  char v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  char IsEqualStringOrNil_s2;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  char v66;
  BOOL v67;
  NSObject *v68;

  v4 = (LBFMLRuntimedEvent *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_9;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v68 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315A78(v68);
    goto LABEL_12;
  }
  v10 = objc_msgSend_eventType(v5, v6, v7, v8, v9);
  if (v10 != objc_msgSend_eventType(self, v11, v12, v13, v14))
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315FC8();
    goto LABEL_12;
  }
  objc_msgSend_succeeded(v5, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_succeeded(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v25, (uint64_t)v19, (uint64_t)v24, v26);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315F34();
    goto LABEL_12;
  }
  objc_msgSend_errorCode(v5, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v38, (uint64_t)v32, (uint64_t)v37, v39);

  if ((v40 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315EA0();
    goto LABEL_12;
  }
  objc_msgSend_errorDomain(v5, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDomain(self, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqualStringOrNil_s2 = objc_msgSend_IsEqualStringOrNil_s2_(LBFUtils, v51, (uint64_t)v45, (uint64_t)v50, v52);

  if ((IsEqualStringOrNil_s2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315E0C();
    goto LABEL_12;
  }
  objc_msgSend_scheduled(v5, v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduled(self, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v64, (uint64_t)v58, (uint64_t)v63, v65);

  if ((v66 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315D78();
LABEL_12:
    v67 = 0;
    goto LABEL_13;
  }
LABEL_9:
  v67 = 1;
LABEL_13:

  return v67;
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

- (NSNumber)scheduled
{
  return self->_scheduled;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduled, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
}

@end
