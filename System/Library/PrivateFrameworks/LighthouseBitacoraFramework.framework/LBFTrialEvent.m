@implementation LBFTrialEvent

- (LBFTrialEvent)initWithAllocation:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  LBFTrialEvent *v7;
  uint64_t v8;
  NSNumber *succeeded;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = -[LBFTrialEvent init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, v3, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 1;
  }
  return v7;
}

- (LBFTrialEvent)initWithActivation:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  LBFTrialEvent *v7;
  uint64_t v8;
  NSNumber *succeeded;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = -[LBFTrialEvent init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, v3, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 2;
  }
  return v7;
}

- (LBFTrialEvent)initWithDeactivation:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  LBFTrialEvent *v7;
  uint64_t v8;
  NSNumber *succeeded;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LBFTrialEvent;
  v7 = -[LBFTrialEvent init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v4, v3, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    succeeded = v7->_succeeded;
    v7->_succeeded = (NSNumber *)v8;

    v7->_eventType = 3;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LBFTrialEvent *v4;
  LBFTrialEvent *v5;
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
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  void *v31;
  void *v32;

  v4 = (LBFTrialEvent *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_6;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v29 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403158E4(v29);
    goto LABEL_9;
  }
  objc_msgSend_succeeded(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_succeeded(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqualNumberOrNil_n2 = objc_msgSend_IsEqualNumberOrNil_n2_(LBFUtils, v16, (uint64_t)v10, (uint64_t)v15, v17);

  if ((IsEqualNumberOrNil_n2 & 1) == 0)
  {
    v31 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403159C4(v31, v5, self);
    goto LABEL_9;
  }
  v23 = objc_msgSend_eventType(v5, v19, v20, v21, v22);
  if (v23 != objc_msgSend_eventType(self, v24, v25, v26, v27))
  {
    v32 = (void *)LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_240315924(v32, v5, self);
LABEL_9:
    v28 = 0;
    goto LABEL_10;
  }
LABEL_6:
  v28 = 1;
LABEL_10:

  return v28;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_succeeded, 0);
}

@end
