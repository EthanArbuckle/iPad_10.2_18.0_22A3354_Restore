@implementation MTROTASoftwareUpdateRequestorClusterStateTransitionEvent

- (MTROTASoftwareUpdateRequestorClusterStateTransitionEvent)init
{
  MTROTASoftwareUpdateRequestorClusterStateTransitionEvent *v2;
  MTROTASoftwareUpdateRequestorClusterStateTransitionEvent *v3;
  NSNumber *previousState;
  NSNumber *newState;
  NSNumber *reason;
  NSNumber *targetSoftwareVersion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTROTASoftwareUpdateRequestorClusterStateTransitionEvent;
  v2 = -[MTROTASoftwareUpdateRequestorClusterStateTransitionEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    previousState = v2->_previousState;
    v2->_previousState = (NSNumber *)&unk_250591B18;

    newState = v3->_newState;
    v3->_newState = (NSNumber *)&unk_250591B18;

    reason = v3->_reason;
    v3->_reason = (NSNumber *)&unk_250591B18;

    targetSoftwareVersion = v3->_targetSoftwareVersion;
    v3->_targetSoftwareVersion = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateRequestorClusterStateTransitionEvent *v4;
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

  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterStateTransitionEvent);
  objc_msgSend_previousState(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousState_(v4, v8, (uint64_t)v7);

  objc_msgSend_getNewState(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNewState_(v4, v12, (uint64_t)v11);

  objc_msgSend_reason(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReason_(v4, v16, (uint64_t)v15);

  objc_msgSend_targetSoftwareVersion(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTargetSoftwareVersion_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: previousState:%@; newState:%@; reason:%@; targetSoftwareVersion:%@; >"),
    v5,
    self->_previousState,
    self->_newState,
    self->_reason,
    self->_targetSoftwareVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(NSNumber *)previousState
{
  objc_setProperty_nonatomic_copy(self, a2, previousState, 8);
}

- (NSNumber)getNewState
{
  return self->_newState;
}

- (void)setNewState:(NSNumber *)newState
{
  objc_setProperty_nonatomic_copy(self, a2, newState, 16);
}

- (NSNumber)reason
{
  return self->_reason;
}

- (void)setReason:(NSNumber *)reason
{
  objc_setProperty_nonatomic_copy(self, a2, reason, 24);
}

- (NSNumber)targetSoftwareVersion
{
  return self->_targetSoftwareVersion;
}

- (void)setTargetSoftwareVersion:(NSNumber *)targetSoftwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, targetSoftwareVersion, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_newState, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
}

@end
