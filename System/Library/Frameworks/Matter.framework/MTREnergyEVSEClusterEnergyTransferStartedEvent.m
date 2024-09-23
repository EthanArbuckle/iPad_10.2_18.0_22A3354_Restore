@implementation MTREnergyEVSEClusterEnergyTransferStartedEvent

- (MTREnergyEVSEClusterEnergyTransferStartedEvent)init
{
  MTREnergyEVSEClusterEnergyTransferStartedEvent *v2;
  MTREnergyEVSEClusterEnergyTransferStartedEvent *v3;
  NSNumber *sessionID;
  NSNumber *state;
  NSNumber *maximumCurrent;
  NSNumber *maximumDischargeCurrent;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTREnergyEVSEClusterEnergyTransferStartedEvent;
  v2 = -[MTREnergyEVSEClusterEnergyTransferStartedEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    sessionID = v2->_sessionID;
    v2->_sessionID = (NSNumber *)&unk_250591B18;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_250591B18;

    maximumCurrent = v3->_maximumCurrent;
    v3->_maximumCurrent = (NSNumber *)&unk_250591B18;

    maximumDischargeCurrent = v3->_maximumDischargeCurrent;
    v3->_maximumDischargeCurrent = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyEVSEClusterEnergyTransferStartedEvent *v4;
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

  v4 = objc_alloc_init(MTREnergyEVSEClusterEnergyTransferStartedEvent);
  objc_msgSend_sessionID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionID_(v4, v8, (uint64_t)v7);

  objc_msgSend_state(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v4, v12, (uint64_t)v11);

  objc_msgSend_maximumCurrent(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumCurrent_(v4, v16, (uint64_t)v15);

  objc_msgSend_maximumDischargeCurrent(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaximumDischargeCurrent_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: sessionID:%@; state:%@; maximumCurrent:%@; maximumDischargeCurrent:%@; >"),
    v5,
    self->_sessionID,
    self->_state,
    self->_maximumCurrent,
    self->_maximumDischargeCurrent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)maximumCurrent
{
  return self->_maximumCurrent;
}

- (void)setMaximumCurrent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)maximumDischargeCurrent
{
  return self->_maximumDischargeCurrent;
}

- (void)setMaximumDischargeCurrent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDischargeCurrent, 0);
  objc_storeStrong((id *)&self->_maximumCurrent, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
