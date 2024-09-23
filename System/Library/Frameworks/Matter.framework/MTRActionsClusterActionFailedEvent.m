@implementation MTRActionsClusterActionFailedEvent

- (MTRActionsClusterActionFailedEvent)init
{
  MTRActionsClusterActionFailedEvent *v2;
  MTRActionsClusterActionFailedEvent *v3;
  NSNumber *actionID;
  NSNumber *invokeID;
  NSNumber *newState;
  NSNumber *error;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRActionsClusterActionFailedEvent;
  v2 = -[MTRActionsClusterActionFailedEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    actionID = v2->_actionID;
    v2->_actionID = (NSNumber *)&unk_250591B18;

    invokeID = v3->_invokeID;
    v3->_invokeID = (NSNumber *)&unk_250591B18;

    newState = v3->_newState;
    v3->_newState = (NSNumber *)&unk_250591B18;

    error = v3->_error;
    v3->_error = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRActionsClusterActionFailedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRActionsClusterActionFailedEvent);
  objc_msgSend_actionID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActionID_(v4, v8, (uint64_t)v7);

  objc_msgSend_invokeID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvokeID_(v4, v12, (uint64_t)v11);

  objc_msgSend_getNewState(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNewState_(v4, v16, (uint64_t)v15);

  objc_msgSend_error(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setError_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: actionID:%@; invokeID:%@; newState:%@; error:%@; >"),
    v5,
    self->_actionID,
    self->_invokeID,
    self->_newState,
    self->_error);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)actionID
{
  return self->_actionID;
}

- (void)setActionID:(NSNumber *)actionID
{
  objc_setProperty_nonatomic_copy(self, a2, actionID, 8);
}

- (NSNumber)invokeID
{
  return self->_invokeID;
}

- (void)setInvokeID:(NSNumber *)invokeID
{
  objc_setProperty_nonatomic_copy(self, a2, invokeID, 16);
}

- (NSNumber)getNewState
{
  return self->_newState;
}

- (void)setNewState:(NSNumber *)newState
{
  objc_setProperty_nonatomic_copy(self, a2, newState, 24);
}

- (NSNumber)error
{
  return self->_error;
}

- (void)setError:(NSNumber *)error
{
  objc_setProperty_nonatomic_copy(self, a2, error, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_newState, 0);
  objc_storeStrong((id *)&self->_invokeID, 0);
  objc_storeStrong((id *)&self->_actionID, 0);
}

@end
