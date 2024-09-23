@implementation LBFDprivacydEvent

- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6
{
  return (LBFDprivacydEvent *)objc_msgSend_initWithEventPhase_eventUUID_succeeded_error_aggregateFunction_count_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, 0, 0);
}

- (LBFDprivacydEvent)initWithEventPhase:(int)a3 eventUUID:(id)a4 succeeded:(BOOL)a5 error:(id)a6 aggregateFunction:(int)a7 count:(int)a8
{
  _BOOL8 v11;
  id v15;
  id v16;
  LBFDprivacydEvent *v17;
  LBFDprivacydEvent *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSNumber *succeeded;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *errorMessage;
  objc_super v35;

  v11 = a5;
  v15 = a4;
  v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)LBFDprivacydEvent;
  v17 = -[LBFDprivacydEvent init](&v35, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_eventPhase = a3;
    objc_storeStrong((id *)&v17->_eventUUID, a4);
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v19, v11, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    succeeded = v18->_succeeded;
    v18->_succeeded = (NSNumber *)v22;

    v18->_errorCode = objc_msgSend_code(v16, v24, v25, v26, v27);
    objc_msgSend_localizedDescription(v16, v28, v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    errorMessage = v18->_errorMessage;
    v18->_errorMessage = (NSString *)v32;

    v18->_aggregateFunction = a7;
    v18->_count = a8;
  }

  return v18;
}

- (int)eventPhase
{
  return self->_eventPhase;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (int)aggregateFunction
{
  return self->_aggregateFunction;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_eventUUID, 0);
}

@end
